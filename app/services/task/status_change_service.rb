class Task::StatusChangeService < ApplicationService
  def initialize(current_user, task_id:, status:)
    @current_user = current_user
    @entity = Task.find(task_id)
    @status = status
    @errors = []
    @success = true
  end

  def call
    statuses = ['done', 'done_confirmed']

    if statuses.include? @status
      concierge = User.find(@entity.concierge_id)
      suggestion = TaskSuggestion.find(@entity.suggestion_id) if @entity.suggestion_id.present?

      message_params = [
          recipient_id: @entity.concierge_id,
          author_id: @current_user.id,
          task_id: @entity.id,
          system: true,
          suggestion_id: @entity.suggestion_id
      ]

      feed_params = {
          owner_id: @current_user.id,
          user_id: @entity.concierge_id,
          notification_type: 'new_message',
          task_id: @entity.id,
          task_title: @entity.title,
          suggestion_id: @entity.suggestion_id,
          task_owner_id: @entity.owner_id
      }

      if @status.eql?('done')

        unless @entity.is_done

          @entity.update_attribute(:status, 'done', fact_end: Date.current)

          message_body = "#{@current_user.first_name} #{@current_user.last_name} — completed your task, please confirm"

          message_params.push(
              recipient_id: @entity.owner_id,
              message_body: message_body
          )

          feed_params.merge!(message: message_body)

          suggestion.update_attribute(:hire_read, false) if suggestion.present?

          Message.create(message_params)

          feed = FeedNotification.new(feed_params)

          if feed.save!
            NotificationsWorker.perform_async(feed.id)
          end
        end

      elsif @status.eql?('done_confirmed')

        unless @entity.done_confirm?

          @entity.update_attributes(status: 'done_confirmed', completed_at: Time.now, fact_end: Date.current)

          message_body = "#{@entity.owner.first_name} #{@entity.owner.last_name}: Has confirmed your work."
          pdf = @entity.generate_pdf_invoice
          @entity.order_changes_confirmed.each do |line|
            @entity.generate_pdf_change_order_invoice(line)
          end
          @entity.checked_completed_quota
          #SendInvoiceToQuickBooksJob.perform_async(@entity.id)

          UserMailer.confirm_task(@entity.concierge.email, @entity.id, @entity.title).deliver if pdf.present?
          UserMailer.confirm_task_astra(Settings['email.invoices'], @entity.id, @entity.title).deliver if pdf.present?

          #message_params.push(
          #  recipient_id: @entity.concierge_id,
          #  message_body: message_body
          # )
          message_params = [
              recipient_id: @entity.concierge_id,
              author_id: @entity.owner_id,
              task_id: @entity.id,
              system: true,
              suggestion_id: @entity.suggestion_id,
              message_body: "#{@entity.owner.first_name} #{@entity.owner.last_name}: Has confirmed your work."
          ]
          feed_params.merge!(message: message_body)

          Message.create(message_params)

          favourites_tasks = FavoriteTask.where(task_id: @entity.id)
          favourites_tasks.destroy_all

          feed = FeedNotification.create(feed_params)

          if feed.save!

            NotificationsWorker.perform_async(feed.id)
          end
        end
      end
    else
      @errors = ['wrong task status']
      @success = false
    end

    @result = @entity
  end
end
