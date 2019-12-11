class Admin::TasksController < Admin::CrudController
  before_action :set_entity, only: [:show, :edit, :update, :destroy, :generate_pdf_change_order, :change_status, :delete_document]
  # load_and_authorize_resource :only => [:show, :edit, :update, :destroy, :index]

  include SendZip

  def index
    @q = Task.distinct.search(params[:q])
    @entities = @q.result.page(params[:page]).per(params[:per_page])
  end

  def moderation
    @q = Task.search(status_eq: 'moderation')
    @entities = @q.result.page(params[:page]).per(params[:per_page])
    render 'admin/tasks/index'
  end

  def new
    @project_task = ProjectTask.find(params[:project])
    @entity = Kernel.const_get(@class_name).new
    @entity.build_place
    @categories = Category.active
    @users = Contract.where(status: :approved, team: [nil, false]).map { |e| e.user }
    if params[:line]
      @price = 0
      begin
        params[:line].count > 1
        @body = ''
        @price = 0
         params[:line].each do |l|
          @line = LineEstimator.find(l)
          @body += "QTY: #{@line.estimator.body_qty_clear(@line)}\n#{@line.name_scope}\n"
          @price += @line.trade_total.to_d
        end
      rescue
        @line = LineEstimator.find(params[:line])
        @body = "QTY: #{@line.estimator.body_qty_clear(@line)}\n#{@line.name_scope}"
        @price += @line.trade_total.to_d
      end
    end
  end

  def show
    @entity.build_place if @entity.place.nil?
    @line_task = LineTask.new
    respond_to do |format|
      format.html { render }
      format.zip { send_zip @entity.documents, filename: "attacments-#{@entity.title}.zip" }
    end
  end

  def edit
    @entity.build_place if @entity.place.nil?
    @line_task = LineTask.new
    @categories = Category.active
    @users = Contract.where(status: :approved, team: [nil, false]).map { |e| e.user }
  end

  def generate_pdf_change_order

  end

  def create
    @entity = Kernel.const_get(@class_name).new(entity_params)
    if @entity.save
      if params[:task][:line]
        params[:task][:line].split.each do |l|
        line = LineEstimator.find(l)
        line.update(task_id: @entity.id) if line
        end
      end
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
          end
        else
          feed = FeedNotification.create(notification_type: 'new_task', task_id: @entity.id, task_title: @entity.title, message: @entity.description, task_owner_id: @entity.owner_id)
          #current_resource_owner.update_attribute(:balance, current_resource_owner.balance - (params[:task][:budget].to_i + (params[:task][:budget].to_i * 0.125)))
          if feed.save!
            CreateTaskNotWorker.perform_async(feed.id)
            #task_payment = TaskPayment.new(user_id: @entity.owner_id, hire: true, task_id: @entity.id, budget: @entity.budget, persents: @entity.budget * 0.125)
            #task_payment.save

          end
        end
        redirect_to admin_task_path(@entity), notice: "Task was successfully created."
      else
        redirect_to admin_task_path(@entity), notice: "#{@class_name} was successfully created."
      end
    else
      render :new
    end
  end

  def delete_document
    file = @entity.documents.find(params[:document])
    file.purge
    redirect_to edit_admin_task_path(@entity)
  end

  def change_status
    status_service = Task::StatusChangeService.call(current_user,
                                                    task_id: @entity.id,
                                                    status: params[:status])
    message = if status_service.success?
                'Status was successfully updated'
              else
                "Status can't be changed"
              end
    redirect_to admin_task_path(@entity.id), notice: message
  end

  def update
    if @entity.update(entity_params)
      if params[:task][:line]
        line = LineEstimator.find(params[:task][:line])
        line.update(task_id: @entity.id) if line
      end
      if @entity.project_task
        redirect_to admin_task_path(@entity), notice: "Task was successfully updated."
      else
        redirect_to admin_task_path(@entity), notice: "#{@class_name} was successfully updated."
      end
    else
      @entity.build_place if @entity.place.nil?
      @line_task = LineTask.new
      @categories = Category.active
      @users = Contract.where(status: :approved, team: [nil, false]).map { |e| e.user }
      render :edit
    end
  end

  def destroy
    @entity.destroy
    if @entity.project_task
      redirect_to admin_project_task_path(@entity.project_task), notice: "Task was successfully updated."
    else
      redirect_to url_for(:action => :index), notice: "#{@class_name} was successfully deleted."
    end
  end

  private

  def set_class_name
    @class_name = 'Task'
  end

  def entity_params
    params.require(:task).permit(:title, :description, :city,
                                 :photo, :photo1, :photo2, :photo3, :photo4, :photo5, :photo6, :photo7,
                                 :delete_photo, :delete_photo1, :delete_photo2, :delete_photo3,
                                 :delete_photo4, :delete_photo5, :delete_photo6, :delete_photo7,
                                 :project_task_id, :concierge_id, :tender, :owner_id, :concierge_id, :date_limit,
                                 :budget, :status, :task_type, :phone, :project_task_id, :apartment, :date_start,
                                 :fact_start, :fact_end,
                                 place_attributes: [:id, :address, :task_id, :apartment],
                                 line_tasks_attributes: [:id, :task_id, :title, :budget, :status, :type_line, :status],
                                 documents: []).tap do |param|
      param[:task_type] = params[:task][:task_type].join(", ") unless params[:task][:task_type].nil?
      param[:date_limit] = parse_time(params[:task][:date_limit])
      param[:date_start] = parse_time(params[:task][:date_start])
      param[:fact_start] = parse_time(params[:task][:fact_start])
    end
  end

  def parse_time(param)
    Date.strptime(param, '%m/%d/%Y') rescue nil
  end
end
