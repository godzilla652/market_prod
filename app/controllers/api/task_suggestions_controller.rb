class Api::TaskSuggestionsController < Api::ApiController

  def index
    @q = TaskSuggestion.search(task_id_eq: params[:id])
    @entities = @q.result.order(id: :desc).page(params[:page]).per(params[:per_page])
  end

  def show
    @entity = TaskSuggestion.find(params[:id])
  end

  def hire_suggestions
    ids = Task.where(owner_id: current_resource_owner.id).pluck(:id)
    ids = ids.blank? ? [0] : ids
    @q = TaskSuggestion.search(task_id_in: ids)

    @entities = @q.result.joins(:messages).order('messages.created_at desc').to_a
    @entities = Kaminari.paginate_array(@entities.uniq).page(params[:page]).per(params[:per_page])
    render 'api/task_suggestions/user_bits'
  end

  def concierge_suggestions
    @q = TaskSuggestion.search(user_id_eq: current_resource_owner.id)
    @entities = @q.result.joins(:messages).order('messages.created_at desc').to_a
    @entities = Kaminari.paginate_array(@entities.uniq).page(params[:page]).per(params[:per_page])
    render 'api/task_suggestions/user_bits'
  end

  def create
    @task = Task.find(params[:id])

    # if @task.owner?(@current_user)
    #   render :json => { errors: { message: [ 'you are task owner' ]}}, :status => 500
    # else

    unless @task.concierge?(@current_user.id)

      if current_resource_owner.first_suggesion?(@task.id)
        #pending if Bit exist

        sug = TaskSuggestion.where(user_id: @current_user.id, task_id: params[:id]).first
        # sug.update_attributes(price: params[:suggestion][:price], proposed_text: params[:suggestion][:proposed_text])
        sug.update_attributes(price: params[:suggestion][:price], proposed_text: params[:suggestion][:proposed_text])
        pending_task = UsersPendingsTask.where(user_id: @current_user.id, task_id: params[:id]).first

        unless pending_task.nil?
          pending_task.increment_positions
          pending_task.update_attributes(position: 1)
        else
          bit = @task.suggestions.create(suggestion_params)
          pending_task = UsersPendingsTask.new(user_id: @current_user.id, task_id: @task.id, position: 1)
          pending_task.increment_positions unless pending_task.nil?
          pending_task.save
        end

        ids = TaskSuggestion.where(user_id: @current_user.id).pluck(:task_id).uniq
        ids_list = ids.blank? ? [0] : ids
        @q = Task.search(id_in: ids_list)
      else
        #availible if BITs not exist

        propose = @task.suggestions.new(suggestion_params)
        if propose.save
          bit = TaskSuggestion.where(user_id: @current_user.id, task_id: params[:id]).first
        end

        pending_task = UsersPendingsTask.new(user_id: @current_user.id, task_id: @task.id, position: 1)
        pending_task.increment_positions unless pending_task.nil?
        pending_task.save

        ids = build_ids.nil? ? [0] : build_ids
        @q = Task.search(id_in: ids)
      end

      message_body = bit.nil? ? sug.proposed_text : bit.proposed_text
      price = bit.nil? ? params[:suggestion][:price] : bit.price

      sug_id = sug.id unless sug.nil? || sug.id.nil?
      sug_id = bit.id unless bit.nil? || bit.id.nil?

      message = Message.create(
        author_id: current_resource_owner.id,
        recipient_id: bit.nil? ? sug.task.owner_id : bit.task.owner_id,
        message_body: "New Bid!\n #{message_body}\n Bid: $#{price}",
        #essage_body: "New Bid! #{current_resource_owner.first_name} #{current_resource_owner.last_name}: #{message_body}.",
        task_id: bit.nil? ? sug.task.id : bit.task.id,
        system: true,
        suggestion_id: sug_id
      )

      suggestion = TaskSuggestion.find(sug_id)
      suggestion.update_attribute(:hire_read, false) #hire must read message

      feed = FeedNotification.create(

        owner_id: bit.nil? ? sug.user_id : bit.user_id,
        user_id: bit.nil? ? sug.task.owner_id : bit.task.owner_id,
        task_title: bit.nil? ? sug.task.title : bit.task.title,
        message: "New Bid! \n #{message_body} ",
        notification_type: 'new_message',
        suggestion_id: sug_id,
        task_id: bit.nil? ? sug.task.id : bit.task.id,
        task_owner_id:  bit.nil? ? sug.task.owner_id : bit.task.owner_id

      )

      if feed.save!
        NotificationsWorker.perform_async(feed.id)
      end

      @entities = @q.result.order(id: :desc).page(params[:page]).per(params[:per_page])

      render 'api/tasks/index'
    else
      render :json => {errors: {message: ['task already confirmed']}}, :status => 500
    end
    #end
  end

  def destroy
    @task_suggestion = TaskSuggestion.find(params[:id])

    if @task_suggestion.destroy
      ids = TaskSuggestion.where(user_id: current_resource_owner.id).pluck(:task_id).uniq

      @q = Task.search(id_in: ids)
      @entities = @q.result.order(id: :desc).page(params[:page]).per(params[:per_page])

      render 'api/tasks/index'
    else
      head :no_content, status: 204
    end
  end

  private

  def suggestion_params
    params.require(:suggestion).permit(:price, :proposed_text).tap do |param|
      param[:user_id] = @current_user.id #current_resource_owner.id
    end
  end

  #NEED OPTIMIZATION!!!!!
  def build_ids
    rezult = []
    my_sugs_tasks_ids = TaskSuggestion.where(user_id: @current_user.id).pluck(:task_id).uniq
    all_null_tasks_ids = Task.where(concierge_id: nil).pluck(:id)
    other_users_sugs_tasks = TaskSuggestion.where.not(user_id: @current_user.id).pluck(:task_id).uniq
    tasks_ids = all_null_tasks_ids - my_sugs_tasks_ids
    rezult << tasks_ids
    rezult << other_users_sugs_tasks
    rezult.reduce(:concat)
  end

end
