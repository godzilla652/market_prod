class Api::RatingsController < Api::ApiController

  def create
    @entity = Rating.new(rating_params)
    task = Task.find(params[:id])
    suggestion = TaskSuggestion.find(task.suggestion_id)
    @entity.task_id = task.id

    if task.owner?(@current_user)
      @entity.hire_id = current_resource_owner.id
      @entity.concierge_id = task.concierge.id
      @entity.hire = true

    else
      @entity.concierge_id = current_resource_owner.id
      @entity.hire_id = task.owner_id
      @entity.concierge = true
    end

    if @entity.save
      #if @entity.stated?
      recipient = User.find(@entity.concierge_id)

      message = Message.create(
          author_id: @entity.hire_id,
          recipient_id: @entity.concierge_id,
          message_body: " You ‘ve been raited!",
          system: true,
          rating: true,
          points: Rating.where(task_id: task.id, hire_id: @entity.hire_id, concierge_id: @entity.concierge_id, hire: true).first.points,
          task_id: task.id,
          suggestion_id: task.suggestion_id
      )

      feed = FeedNotification.create(owner_id: @entity.hire_id, user_id: message.recipient_id, notification_type: 'new_message', task_id: task.id, suggestion_id: suggestion.id, task_title: task.title, message: "You have got a rating.", task_owner_id: task.owner_id)

      if feed.save!
        NotificationsWorker.perform_async(feed.id)
      end

      #recipient = User.find(@entity.hire_id)

      #message = Message.create(
      # author_id:  @entity.concierge_id,
      # recipient_id: @entity.hire_id,
      # message_body: " You ‘ve been raited!",
      # system: true,
      # rating: true,
      # points: Rating.where(task_id: task.id, hire_id: @entity.hire_id, concierge_id: @entity.concierge_id, concierge: true).first.points,
      # task_id: task.id,
      # suggestion_id: task.suggestion_id
      #)
      #suggestion.update_attribute(:hire_read, false)
      # suggestion.update_attribute(:concierge_read, false)

      #feed = FeedNotification.create(owner_id: @entity.concierge_id, user_id: message.recipient_id, notification_type: 'new_message', task_id: task.id, suggestion_id: suggestion.id, task_title: task.title, message: "You have got a rating.", task_owner_id: task.owner_id)
      #if feed.save!
      #  NotificationsWorker.perform_async(feed.id)
      # end
      #end

      render :json => {status: 'ok'}, :status => 200
    else
      respond_with @entity
    end
  end

  def couple(rating, task)
    Rating.where(hire_id: rating.hire_id, concierge_id: rating.concierge_id, task_id: task.id)
  end

  def show
    @entity = User.find(params[:id])
    rating = @entity.rating(params[:role])
    render :json => {rating: rating}, :status => 200
  end

  private

  def rating_params
    params.require(:rating).permit(:points)
  end
end
