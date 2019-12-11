namespace :tasks do
  desc "TODO"
  task check_deadline: :environment do

    tasks = Task.where(date_limit: Date.tomorrow).where.not(status: 'done_confirmed')

    unless tasks.nil?
      tasks.each do |task|

        hire = User.find(task.owner_id)
        concierge = User.find(task.concierge_id) unless task.concierge_id.nil?

        hire_feed = FeedNotification.create(
            message: "Dear '#{hire.first_name} #{hire.last_name}'. Please note, that your task '#{task.title}' is due tomorrow, '#{Date.tomorrow}'",
            notification_type: 'dead_line',
            task_title: task.title,
            task_id: task.id,
            user_id: task.owner_id
        )

        if hire_feed.save!
          NotificationsWorker.perform_async(hire_feed.id)
        end

        if concierge
          concierge_feed = FeedNotification.create(
              message: "Dear '#{concierge.first_name} #{concierge.last_name}'. Please note, that your task '#{task.title}' is due tomorrow, '#{Date.tomorrow}'",
              notification_type: 'dead_line',
              task_title: task.title,
              task_id: task.id,
              user_id: task.concierge_id
          )

          if concierge_feed.save!
            NotificationsWorker.perform_async(concierge_feed.id)
          end
        end
      end
    end
  end
end
