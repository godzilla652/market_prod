require 'fcm'

class CreateTaskNotWorker
  include Sidekiq::Worker
  #sidekiq_options :queue => :notification_sender

  #sidekiq_options :queue => :default

  def perform(notification_id)

    puts notification_id
    @notification = FeedNotification.where(["id = ? AND sent = ?", notification_id, 0]).first
    unless @notification.nil?
      task = Task.find(@notification.task_id)
      if task
        options = {
          data: {
            body: {
              push_type: @notification.notification_type,
              title: @notification.task_title,
              message: @notification.message,
              budget: task.budget,
              task_id: @notification.task_id,
              suggestion_id: @notification.suggestion_id,
              task_owner_id: @notification.task_owner_id
            }
          },
          notification: {
            title: @notification.task_title,
            body: @notification.message
          }
        }.as_json

        contracts = Contract.where(status: 'approved', team: [nil, false]).where.not(user_id: 0).search({m: 'and', type_work_cont: task.task_type}).result
        contracts.each do |contract|
          address = (task.place.address if task.place)
          UserMailer.new_task_not_worker(contract.user.email, task.title, task.description, address, task.id, contract.user.id, task.budget).deliver
          ids = contract.user.devices.pluck(:token)
          puts ids.inspect
          p 'p2p'
          response = fcm.send(ids, options)
          p response
        end
      end
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
