class Api::MessagesController < Api::ApiController

  def concierge_task_messages

    suggestion = TaskSuggestion.search(
        {
            m: 'and',
            user_id_eq: @current_user.id,
            task_id_eq: params[:id]
        }
    ).result

    suggestion_id = suggestion.pluck(:id)[0].nil? ? 0 : suggestion.pluck(:id)[0]

    @q = Message.search(
        {
            m: 'and',
            task_id_eq: params[:id],
            suggestion_id_eq: suggestion_id
        }
    )

    unless suggestion.first.nil?
      suggestion.first.update_attribute(:concierge_read, true)
    end

    @entities = reverse_paginate(@q.result, params[:page])
    render 'api/messages/index'
  end

  def hire_task_messages

    @q = Message.search(
        {
            m: 'and', task_id_eq: params[:id],
            suggestion_id_eq: params[:suggestion_id]
        }
    )
    @entities = reverse_paginate(@q.result, params[:page])
    render 'api/messages/index'
  end

  def sugesstion_messages

    suggestion = TaskSuggestion.find(params[:id])
    suggestion.update_attribute(:hire_read, true)
    @q = Message.where(suggestion_id: params[:id])
    @entities = reverse_paginate(@q, params[:page])
    render 'api/messages/index'
  end

  def new_messages

    suggestion = TaskSuggestion.search(
        {
            m: 'and',
            user_id_eq: @current_user.id,
            task_id_eq: params[:id]
        }
    ).result.pluck(:id)[0]

    @q = Message.search(
        {
            m: 'and',
            id_gt: params[:message_id],
            task_id_eq: params[:id],
            suggestion_id_eq: suggestion
        }
    )
    @entities = @q.result.order(id: :asc)
  end

  def create
    Paperclip::UriAdapter.register
    Paperclip::DataUriAdapter.register

    task = Task.find(params[:id])
    #unless task.owner?(@current_user)

    message = task.messages.create(message_params)
    #message = Message.create(task_id: task.id)
    #message = message.update(message_params)
    message.save!

    unless params[:message][:suggestion_id].present?
      sugesstion_id = TaskSuggestion.search(
          {
              m: 'and',
              user_id_eq: @current_user.id,
              task_id_eq: params[:id]
          }
      ).result.pluck(:id)[0]
    else
      sugesstion_id = params[:message][:suggestion_id]
    end

    @q = Message.search(
        {
            m: 'and', task_id_eq: params[:id],
            suggestion_id_eq: sugesstion_id
        }
    )

    feed = FeedNotification.create(
        owner_id: @current_user.id,
        user_id: message.recipient_id,
        task_title: task.title,
        message: message.message_body,
        notification_type: 'new_message',
        task_id: task.id,
        task_owner_id: task.owner_id,
        suggestion_id: message.suggestion_id
    )

    if feed.save!
      puts "Message created"
      NotificationsWorker.perform_async(feed.id)
    end

    @entities = reverse_paginate(@q.result, params[:page])
    #@entities = @q.result.order(id: :asc).page(params[:page]).per(params[:per_page])
    render 'api/messages/index'
    # else
    #   render :json => {message: [ "you can't write message to yourself"]}, :status => 500
    # end
  end

  private

  def reverse_paginate(scope, page)
    if page
      page_number = page
    else
      page_number = Kaminari.paginate_array(scope.reverse).page(1).per(25).max_pages
    end
    Kaminari.paginate_array(scope.reverse).page(page_number).per(25).reverse!
  end

  def message_params
    task = Task.find(params[:id])
    params.require(:message).permit(:message_body, :user_id, :suggestion_id, :file).tap do |message_param|
      message_param[:author] = @current_user
      if params[:message].has_key?(:suggestion_id) #role hire
        suggestion = TaskSuggestion.find(params[:message][:suggestion_id])
        message_param[:recipient_id] = suggestion.user_id
        message_param[:suggestion_id] = suggestion.id

        suggestion.update_attribute(:concierge_read, false) #concierge must read message
      elsif !task.suggestion?(@current_user) #role concierge without propose

        suggestion = TaskSuggestion.create(user_id: @current_user.id, task_id: params[:id])
        suggestion.save

        message_param[:recipient_id] = task.owner.id
        message_param[:suggestion_id] = suggestion.id

        suggestion.update_attribute(:hire_read, false) #hire must read message
      elsif task.suggestion?(@current_user)

        suggestion = TaskSuggestion.where(user_id: @current_user.id, task_id: task.id).first
        message_param[:suggestion_id] = suggestion.id
        message_param[:recipient_id] = task.owner.id

        suggestion.update_attribute(:hire_read, false) #hire must read message
      end
    end
  end
end
