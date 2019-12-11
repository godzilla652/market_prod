require 'fcm'

class NotificationsWorker
  include Sidekiq::Worker
  #sidekiq_options :queue => :notification_sender

  #sidekiq_options :queue => :default

  def perform(notification_id)

    puts notification_id
    @notification = FeedNotification.where(["id = ? AND sent = ?", notification_id, 0]).first
    unless @notification.nil?

      ids = @notification.user.devices.pluck(:token)
      task = Task.find(@notification.task_id)
      puts ids.inspect
      p 'p2p'

      options = {
        data: {
          body: {
            push_type: @notification.notification_type,
            title: @notification.task_title,
            message: @notification.message,
            task_id: @notification.task_id,
            suggestion_id: @notification.suggestion_id,
            task_owner_id: @notification.task_owner_id,
            tender: task.tender
          }
        },
        notification: {
          title: @notification.task_title,
          body: @notification.message
        }
      }.as_json

      response = fcm.send(ids, options)
      p response


      @notification.update_attribute(:sent, 1)
      puts "============notification_id=============>>>>"
      p @notification
    end
  end

  private

  def fcm
    @fcm ||= FCM.new("#{Settings.gcm_api_key}")
  end
end
