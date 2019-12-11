class Api::TasksController < Api::ApiController

  def index
  end

  def cities

    @cities = Contract.cities_canada
  end

  def show

    @entity = Task.find(params[:id])
  end

  # done - from mobile app, contractor (pending checking from superviser)
  # done_confirmed - mobile app/admin, superviser (task closed)
  def change_task_status

    statuses = ['done', 'done_confirmed']

    if statuses.include? params[:status]
      @entity = Task.find(params[:id])
      concierge = User.find(@entity.concierge_id)
      suggestion = TaskSuggestion.find(@entity.suggestion_id) if @entity.suggestion_id.present?

      if params[:status].eql?('done')

        unless @entity.done?

          @entity.update_attributes(status: 'done', fact_end: Date.current)
          UserMailer.done_task_astra(@entity.owner.email, "#{@current_user.first_name} #{@current_user.last_name}",
                                     @entity.title).deliver

          message_body = "#{@current_user.first_name} #{@current_user.last_name} — completed your task, please confirm"

          message_params = [
              recipient_id: @entity.owner_id,
              author_id: @current_user.id,
              message_body: message_body,
              task_id: @entity.id,
              system: true,
              suggestion_id: @entity.suggestion_id
          ]

          feed_params = params.permit().tap do |param|
            param[:owner_id] = @current_user.id #author_id
            param[:user_id] = @entity.owner_id #author_id
            param[:message] = message_body
            param[:notification_type] = 'new_message'
            param[:task_id] = @entity.id
            param[:task_title] = @entity.title
            param[:suggestion_id] = @entity.suggestion_id
            param[:task_owner_id] = @entity.owner_id
          end

          suggestion.update_attribute(:hire_read, false) if suggestion.present?

          Message.create(message_params)

          feed = FeedNotification.new(feed_params)

          if feed.save!
            NotificationsWorker.perform_async(feed.id)
          end
        end

      elsif params[:status].eql?('done_confirmed')

        unless @entity.done_confirm?

          @entity.update_attributes(status: 'done_confirmed', completed_at: Time.now, fact_end: Date.current)

          message_body = "#{@current_user.first_name} #{@current_user.last_name}: Has confirmed your work." if params[:status].eql?('done_confirmed')
          pdf = @entity.generate_pdf_invoice
          @entity.order_changes_confirmed.each do |line|
            @entity.generate_pdf_change_order_invoice(line)
          end
          @entity.checked_completed_quota
          SendInvoiceToQuickBooksJob.perform_async(@entity.id)
          UserMailer.confirm_task(@entity.concierge.email, @entity.id, @entity.title).deliver if pdf.present?
          UserMailer.confirm_task_astra(Settings['email.invoices'], @entity.id, @entity.title).deliver if pdf.present?
          message_params = [
              recipient_id: @entity.concierge_id,
              author_id: @current_user.id,
              task_id: @entity.id,
              message_body: message_body,
              system: true,
              suggestion_id: @entity.suggestion_id
          ]

          feed_params = params.permit().tap do |param|
            param[:owner_id] = @current_user.id #author_id
            param[:user_id] = @entity.concierge_id #recipient_id
            param[:message] = message_body
            param[:notification_type] = 'new_message'
            param[:task_id] = @entity.id
            param[:task_title] = @entity.title
            param[:suggestion_id] = @entity.suggestion_id
            param[:task_owner_id] = @entity.owner_id
          end

          Message.create(message_params)

          # Message.create(
          #  author_id: @entity.owner_id,
          #  recipient_id: @entity.concierge_id,
          #   message_body: "You 've been raited!",
          #   task_id: @entity.id,
          #   rating: true,
          #   system: true,
          #   give_a_rate: true,
          #    suggestion_id: @entity.suggestion_id
          #  )

          favourites_tasks = FavoriteTask.where(task_id: @entity.id)
          favourites_tasks.destroy_all

          #concierge.update_attribute(:balance, concierge.balance.to_f + @entity.budget.to_f) #Added
          #TaskPayment.create(user_id: @entity.concierge_id, concierge: true, task_id: @entity.id , budget: @entity.budget.to_f)

          feed = FeedNotification.create(feed_params)
          if feed.save!
            NotificationsWorker.perform_async(feed.id)
          end
        end
      end

      render 'api/tasks/show'
    else
      render :json => {errors: {message: ['wrong task status']}}, :status => 500
    end
  end

  def my_tasks
    @q = @current_user.tasks.to_a
    @entities = Kaminari.paginate_array(@q).page(params[:page]).per(params[:per_page])
    render 'api/tasks/index'
  end

  # confirm task to start work
  # if tender -> superviser confirm bid
  # if not tender -> contractor confirm task
  def confirm_task

    @entity = Task.find(params[:id])
    concierge = User.find(params[:user_id])

    budget = @entity.budget

    if @entity.tender?
      budget = TaskSuggestion.find(params[:suggestion_id]).price unless params[:budget].present?
    end

    budget = params[:budget] if params[:budget].present?

    pending_tasks = UsersPendingsTask.where(task_id: @entity.id)
    pending_tasks.destroy_all unless pending_tasks.nil?

    unless @entity.accepted?

      #if @current_user.balance.to_f >= calculate_surcharge(@entity.budget, budget) #(budget + (budget.to_i*10)/100).to_f
      #  @current_user.update_attribute(:balance, @current_user.balance.to_f - calculate_surcharge(@entity.budget, budget)) unless budget.to_f < @entity.budget.to_f  #(budget + (budget.to_i*10)/100))

      if @entity.owner?(@current_user) && params.has_key?(:user_id) # && @entity.accepted?
        #if budget.to_f < @entity.budget.to_f # Do a return of money to hire balance

        # @current_user.update_attribute(:balance,  @current_user.balance + (@entity.budget.to_f - budget.to_f))
        #@current_user.increase_balance(@entity.budget) #budget - (budget.to_i*10)/100) #@entity not budget
        # end

        @entity.update_attributes(status: 'confirmed', concierge_id: concierge.id,
                                  suggestion_id: params[:suggestion_id], budget: budget,
                                  confirmed_at: Time.now, fact_start: Date.current)
        pdf = @entity.generate_pdf
        UserMailer.accepted_task(@entity.concierge.email, @entity.id, @entity.title).deliver if pdf.present?
        UserMailer.accepted_task_astra(Settings['email.work_order'], @entity.id, @entity.title).deliver if pdf.present?
        message = Message.create(
            author_id: current_resource_owner.id,
            recipient_id: concierge.id,
            message_body: "Congratulations! #{concierge.first_name} #{concierge.last_name}: Your bid was accepted.",
            task_id: @entity.id,
            system: true,
            suggestion_id: params[:suggestion_id]
        )

        feed = FeedNotification.create(
            owner_id: @current_user.id,
            user_id: message.recipient_id,
            task_title: @entity.title,
            message: "Congratulations! #{concierge.first_name} #{concierge.last_name}: Your bid was accepted. ",
            notification_type: 'new_message',
            task_id: @entity.id,
            suggestion_id: @entity.suggestion_id,
            task_owner_id: @entity.owner_id
        )
        if feed.save!
          NotificationsWorker.perform_async(feed.id)
        end


        #TaskPayment.create(user_id: concierge.id, concierge: true, task_id: @entity.id , budget: @entity.budget.to_f)

        render 'api/tasks/show'

      else
        unless @entity.tender?
          @entity.update_attributes(status: 'confirmed', concierge_id: concierge.id,
                                    suggestion_id: params[:suggestion_id], budget: budget,
                                    confirmed_at: Time.now, fact_start: Date.current)
          pdf = @entity.generate_pdf
          UserMailer.accepted_task_conc(@entity.concierge.email, @entity.id, @entity.title).deliver if pdf.present?
          UserMailer.accepted_task_astra(Settings['email.work_order'], @entity.id, @entity.title).deliver if pdf.present?
          message = Message.create(
              author_id: @entity.concierge_id,
              recipient_id: @entity.owner_id,
              message_body: "#{@entity.concierge.first_name} #{@entity.concierge.last_name} has accepted your work offer",
              task_id: @entity.id,
              system: true,
              suggestion_id: @entity.suggestion_id
          )

          feed = FeedNotification.create(
              owner_id: @entity.concierge_id,
              user_id: message.recipient_id,
              task_title: @entity.title,
              message: "#{@entity.concierge.first_name} #{@entity.concierge.last_name} has accepted your work offer",
              notification_type: 'new_message',
              task_id: @entity.id,
              suggestion_id: @entity.suggestion_id,
              task_owner_id: @entity.owner_id
          )
          if feed.save!
            NotificationsWorker.perform_async(feed.id)
          end
          render 'api/tasks/show'
        else
          render :json => {errors: {message: ['missed param user_id']}}, :status => 500
        end


      end
      # else
      #  render :json => { message: [ 'not enough money' ]}, :status => 500
      # end

    else
      unless @entity.tender?
        @entity.update_attributes(status: 'confirmed', concierge_id: concierge.id,
                                  suggestion_id: params[:suggestion_id], budget: budget,
                                  confirmed_at: Time.now, fact_start: Date.current)
        pdf = @entity.generate_pdf
        UserMailer.accepted_task_conc(@entity.concierge.email, @entity.id, @entity.title).deliver if pdf.present?
        UserMailer.accepted_task_astra(Settings['email.work_order'], @entity.id, @entity.title).deliver if pdf.present?
        message = Message.create(
            author_id: @entity.concierge_id,
            recipient_id: @entity.owner_id,
            message_body: "#{@entity.concierge.first_name} #{@entity.concierge.last_name} has accepted your work offer",
            task_id: @entity.id,
            system: true,
            suggestion_id: @entity.suggestion_id
        )

        feed = FeedNotification.create(
            owner_id: @entity.concierge_id,
            user_id: message.recipient_id,
            task_title: @entity.title,
            message: "#{@entity.concierge.first_name} #{@entity.concierge.last_name} has accepted your work offer",
            notification_type: 'new_message',
            task_id: @entity.id,
            suggestion_id: @entity.suggestion_id,
            task_owner_id: @entity.owner_id
        )
        if feed.save!
          NotificationsWorker.perform_async(feed.id)
        end
        render 'api/tasks/show'
      else
        render :json => {errors: {message: ['task already confirmed']}}, :status => 500
      end

    end
  end

  def tasks_hire_posted

    if params[:project_id].present?
      @q = ProjectTask.find(params[:project_id]).tasks.search({:m => 'and', owner_id_eq: @current_user.id, status_eq: 'posted', task_type_eq: params[:task_type]})
      @entities = @q.result.order(id: :desc).page(params[:page]).per(params[:per_page])
      render 'api/tasks/index'
    else
      @q = Task.search({:m => 'and', owner_id_eq: @current_user.id, status_eq: 'posted', task_type_eq: params[:task_type]})
      @counts = []
      @entities = @q.result.map { |e| @counts << e.project_task.id; e.project_task }.uniq
      #@entities = @q.result.map{|e| e.project_task}.uniq
      render 'api/projects/index'
    end
  end

  def tasks_hire_carrent

    if params[:project_id].present?
      tasks = ProjectTask.find(params[:project_id]).tasks
      ids = tasks.where(status: 'confirmed').or(tasks.where(status: 'done')).pluck(:id)
      ids = ids.blank? ? [0] : ids
      @q = tasks.search({:m => 'and', owner_id_eq: @current_user.id, id_in: ids, task_type_eq: params[:task_type]})
      @entities = @q.result.order(id: :desc).page(params[:page]).per(params[:per_page])
      render 'api/tasks/index'
    else
      ids = Task.where(status: 'confirmed').or(Task.where(status: 'done')).pluck(:id)
      ids = ids.blank? ? [0] : ids
      @q = Task.search({:m => 'and', owner_id_eq: @current_user.id, id_in: ids, task_type_eq: params[:task_type]})
      @counts = []
      @entities = @q.result.map { |e| @counts << e.project_task.id; e.project_task }.uniq
      #@entities = @q.result.map{|e| e.project_task}.uniq
      render 'api/projects/index'
    end
  end

  def tasks_hire_past

    if params[:project_id].present?
      @q = ProjectTask.find(params[:project_id]).tasks.search({:m => 'and', owner_id_eq: @current_user.id, status_eq: 'done_confirmed', task_type_eq: params[:task_type]})
      @entities = @q.result.order(completed_at: :desc).page(params[:page]).per(params[:per_page])
      render 'api/tasks/index'
    else
      @q = Task.search({:m => 'and', owner_id_eq: @current_user.id, status_eq: 'done_confirmed', task_type_eq: params[:task_type]})
      @counts = []
      @entities = @q.result.map { |e| @counts << e.project_task.id; e.project_task }.uniq
      #binding.pry
      render 'api/projects/index'
    end
  end

  def tasks_concierge_active

    if params[:project_id].present?
      tasks = ProjectTask.find(params[:project_id]).tasks
      ids = tasks.where(status: 'confirmed').or(tasks.where(status: 'done')).pluck(:id)
      ids = ids.blank? ? [0] : ids
      @q = tasks.search({m: 'and', concierge_id_eq: @current_user.id, ids_is: ids, task_type_eq: params[:task_type]})
      @entities = @q.result.where(status: ['confirmed', 'done']).order(confirmed_at: :desc).page(params[:page]).per(params[:per_page])
      render 'api/tasks/index'
    else
      ids = Task.where(status: 'confirmed').or(Task.where(status: 'done')).pluck(:id)
      ids = ids.blank? ? [0] : ids
      @q = Task.search({m: 'and', concierge_id_eq: @current_user.id, ids_is: ids, task_type_eq: params[:task_type]})
      @counts = []
      @entities = @q.result.where(status: ['confirmed', 'done']).order(confirmed_at: :desc).map { |e| @counts << e.project_task.id; e.project_task }.uniq
      #@entities = @q.result.map{|e| e.project_task}.uniq
      render 'api/projects/index'
    end

  end

  def tasks_concierge_pending

    ids_list = @current_user.pending_tasks.pluck(:task_id)
    ids = ids_list.any? ? ids_list : [0]
    if params[:project_id].present?
      tasks_all = ProjectTask.find(params[:project_id]).tasks
      @q = tasks_all.search({m: 'and', id_in: ids, task_type_eq: params[:task_type]})
      tasks = @q.result.joins(:users_pendings_task).order('position ASC')
      @entities = Kaminari.paginate_array(tasks.to_a.uniq).page(params[:page]).per(params[:per_page])
      render 'api/tasks/index'
    else
      @q = Task.search({m: 'and', id_in: ids, task_type_eq: params[:task_type]})
      tasks = @q.result.joins(:users_pendings_task).order('position ASC')
      @counts = []
      @entities = tasks.map { |e| @counts << e.project_task.id; e.project_task }.uniq
      #@entities = tasks.map{|e| e.project_task}.uniq
      render 'api/projects/index'
    end

  end

  def tasks_concierge_archive

    #if params[:project_id].present?
    # tasks_all = ProjectTask.find(params[:project_id]).tasks
    #@q = tasks_all.search({m: 'and', concierge_id_eq: @current_user.id, status_eq: 'done_confirmed'})
    #@entities = @q.result.order(id: :desc).page(params[:page]).per(params[:per_page])
    #render 'api/tasks/index'
    #else
    @q = Task.search({m: 'and', concierge_id_eq: @current_user.id, status_eq: 'done_confirmed'})
    @entities = @q.result.order(id: :desc).page(params[:page]).per(params[:per_page])
    render 'api/tasks/index'
    #end
  end

  def tasks_concierge_available

    ids = build_ids.any? ? build_ids : [0]
    categ = (@current_user.contract.type_work.nil? ? nil : @current_user.contract.type_work.split(", ")) if @current_user.contract
    if params[:project_id].present?
      tasks_all = ProjectTask.find(params[:project_id]).tasks
      @q = tasks_all.search({m: 'and', id_in: ids, status_eq: 'posted', task_type_in: categ})
      @entities = @q.result.order(id: :desc).page(params[:page]).per(params[:per_page])
      render 'api/tasks/index'
    else
      @q = Task.search({m: 'and', id_in: ids, status_eq: 'posted', task_type_in: categ})
      @counts = []
      @entities = @q.result.map { |e| @counts << e.project_task.id; e.project_task }.uniq
      #@entities = @q.result.map{|e| e.project_task}.uniq
      render 'api/projects/index'
    end
  end

  def create

    #if current_resource_owner.balance.to_f <= (params[:task][:budget].to_f + (params[:task][:budget].to_f*12.5)/100)
    #render :json => { errors: { message: [ 'Not enough money in the account' ]}}, :status => 200
    #else
    @entity = Task.new(task_params)

    if @entity.save
      place = Place.new(palace_params)
      place.save
      if @entity.tender?
        feed = FeedNotification.create(notification_type: 'new_task', task_id: @entity.id, task_title: @entity.title, message: @entity.description, task_owner_id: @entity.owner_id, suggestion_id: @entity.suggestion_id)
        #current_resource_owner.update_attribute(:balance, current_resource_owner.balance - (params[:task][:budget].to_i + (params[:task][:budget].to_i * 0.125)))
        if feed.save!
          CreateTaskNotWorker.perform_async(feed.id)
          #task_payment = TaskPayment.new(user_id: @entity.owner_id, hire: true, task_id: @entity.id, budget: @entity.budget, persents: @entity.budget * 0.125)
          #task_payment.save
          render 'api/tasks/show'
        end
      else
        address = (@entity.place.address if @entity.place)
        if @entity.concierge.present?
          UserMailer.new_task(@entity.concierge.email, @entity.title, @entity.description, address, @entity.id,
                              @entity.concierge.id, @entity.budget).deliver if @entity.concierge.present?
          Message.create(
              author_id: @entity.owner.id,
              recipient_id: @entity.concierge.id,
              message_body: "New Task",
              task_id: @entity.id,
              system: true
          )
        end

        if @entity.project_task
          if @entity.concierge.present?
            feed = FeedNotification.create(notification_type: 'new_task', task_id: @entity.id, task_title: @entity.title,
                                           message: @entity.description, task_owner_id: @entity.owner_id,
                                           suggestion_id: @entity.suggestion_id, user_id: @entity.concierge_id)
            #current_resource_owner.update_attribute(:balance, current_resource_owner.balance - (params[:task][:budget].to_i + (params[:task][:budget].to_i * 0.125)))

            if feed.save!
              NotificationsWorker.perform_async(feed.id)
              #task_payment = TaskPayment.new(user_id: @entity.owner_id, hire: true, task_id: @entity.id, budget: @entity.budget, persents: @entity.budget * 0.125)
              #task_payment.save
              render 'api/tasks/show'
            end
          else
            feed = FeedNotification.create(notification_type: 'new_task', task_id: @entity.id, task_title: @entity.title,
                                           message: @entity.description, task_owner_id: @entity.owner_id)
            #current_resource_owner.update_attribute(:balance, current_resource_owner.balance - (params[:task][:budget].to_i + (params[:task][:budget].to_i * 0.125)))
            if feed.save!
              CreateTaskNotWorker.perform_async(feed.id)
              #task_payment = TaskPayment.new(user_id: @entity.owner_id, hire: true, task_id: @entity.id, budget: @entity.budget, persents: @entity.budget * 0.125)
              #task_payment.save
              render 'api/tasks/show'
            end
          end
        end
      end
    else
      render :json => {errors: {message: ['missing param: title']}}, :status => 500
      #render :json => { errors: { message: @entity.errors }}, :status => 500
    end
    #end
  end

  def destroy

    @entity = Task.find(params[:id])
    if @entity.owner?(@current_user)

      @current_user.increase_balance(@entity.budget)

      @entity.destroy

      feed = FeedNotification.create(notification_type: 'destroy_task', task_id: @entity.id)
      if feed.save!
        NotificationsWorker.perform_async(feed.id)
      end

      @q = Task.search(owner_id_eq: @current_user.id)
      @entities = @q.result.order(id: :desc).page(params[:page]).per(params[:per_page])
      render 'api/tasks/index'
    else
      return head :no_content, status: 204
    end
  end

  def update

    @entity = Task.find(params[:id])
    if params[:photo_update] == 'true'
      @entity.photo.destroy unless @entity.photo.nil?
      @entity.photo1.destroy unless @entity.photo1.nil?
      @entity.photo2.destroy unless @entity.photo2.nil?
      @entity.photo3.destroy unless @entity.photo3.nil?
      @entity.photo4.destroy unless @entity.photo4.nil?
      @entity.photo5.destroy unless @entity.photo5.nil?
      @entity.photo6.destroy unless @entity.photo6.nil?
      @entity.photo7.destroy unless @entity.photo7.nil?
    end

    @place = @entity.place

    if @entity.owner?(@current_user) && @entity.update!(task_params)

      if params[:place].present?
        @place.update_attributes(
            latitude: params[:place][:latitude],
            longitude: params[:place][:longitude],
            address: params[:place][:address],
            apartment: params[:place][:apartment])
      end

      @q = Task.search(owner_eq: @current_user)

      feed = FeedNotification.create(notification_type: 'update_task', task_id: @entity.id)

      if feed.save!
        NotificationsWorker.perform_async(feed.id)
      end

      @entities = @q.result.order(id: :desc).page(params[:page]).per(params[:per_page])
      render 'api/tasks/index'
    else
      return head :no_content, status: 204
    end
  end

  private

  # NEED OPTIMIZATION!!!!!
  def build_ids
    rezult = []
    all_my_pendings_tasks = @current_user.pending_tasks.pluck(:task_id)
    all_my_tasks = Task.where(owner_id: @current_user.id).pluck(:id)
    all_newconc_tasks_ids = Task.where(concierge_id: @current_user.id, status: 'posted', tender: [nil, false]).pluck(:id)
    my_sugs_tasks_ids = TaskSuggestion.where(['user_id = ? and price = ?', @current_user.id, nil]).pluck(:task_id).uniq
    all_null_tasks_ids = Task.where(concierge_id: nil, tender: true).pluck(:id)
    #other_users_sugs_tasks = TaskSuggestion.where.not(user_id: @current_user.id).pluck(:task_id).uniq
    tasks_ids = all_null_tasks_ids - my_sugs_tasks_ids
    rezult << tasks_ids
    #rezult << other_users_sugs_tasks
    rezult << all_newconc_tasks_ids
    rezult = rezult.reduce(:concat)
    rezult -= all_my_pendings_tasks
    rezult -= all_my_tasks
    rezult
  end

  def calculate_surcharge(task_budget, propose_budget)
    ((propose_budget - task_budget) * 0.125 + (propose_budget - task_budget))
  end

  def task_params
    params.require(:task).permit(
        :title, :description, :type, :date_limit, :city,
        :status, :phone, :budget, :task_type,
        :photo, :photo1, :photo2, :photo3,
        :photo4, :photo5, :photo6, :photo7, :project_task_id, :concierge_id, :tender, :apartment, :date_start,
        :fact_start, :fact_end
    ).tap do |param|
      param[:owner] = current_resource_owner
    end
  end

  def palace_params
    params.require(:place).permit(:latitude, :longitude, :address, :apartment).tap do |param|
      param[:task_id] = @entity.id
    end
  end
end
