class LineTask < ApplicationRecord
  belongs_to :task

  after_update :push_mess
  after_create :gen_pdf_file
  after_create :push_mess_add

  scope :change_orders, -> { where(type_line: 'Change Order') }
  scope :back_charges, -> { where(type_line: 'Back Charge') }

  default_scope { order("created_at DESC") }

  def gen_pdf_file
    case type_line
    when 'Back Charge' then
      task.generate_pdf_charge_back(self)
    when 'Change Order' then
      task.generate_pdf_change_order(self)
    end
  end

  def invoice_pdf_path
    if type_line == 'Change Order'
      "/change/change_order_#{id}.pdf"
    else
      "/back/back_order_#{id}.pdf"
    end
  end

  def invoice_order_pdf_path
    "/invoice_orders/invoice_change_order_#{id}.pdf"
  end

  def budget_tax
    budget.to_f * (task&.gst_calc&.to_d || 0) / 100.0
  end

  def total_budget
    budget.to_f + budget_tax
  end

  def push_mess_add
    address = (task.place.address if task.place)

    if type_line == "Change Order"
      if task.concierge.present?
        UserMailer.new_change_order(task.concierge.email, task.title, task.description, address, task.id,
                                    task.concierge.id, task.full_sum, id).deliver if task.concierge.present?
        Message.create(
            author_id: task.owner.id,
            recipient_id: task.concierge.id,
            message_body: "Please confirm the Change Order",
            task_id: task.id,
            system: true,
            type_message: 'change_order',
            id_line_task: id,
            title: title,
            budget: budget,
            type_line: type_line,
            status: status,
            suggestion_id: task.suggestion_id,
            budget_task: task.budget,
            total: task.total_sum
        )
        feed = FeedNotification.create(notification_type: 'new_message', task_id: task.id, task_title: task.title,
                                       message: "Please confirm the Change Order", task_owner_id: task.owner_id,
                                       suggestion_id: task.suggestion_id, user_id: task.concierge_id)

        if feed.save!
          NotificationsWorker.perform_async(feed.id)
        end
      end

    else
      if task.concierge.present?
        UserMailer.new_back_line(task.concierge.email, self.id, task.title).deliver
        Message.create(
            author_id: task.owner.id,
            recipient_id: task.concierge.id,
            message_body: "Back Charge",
            task_id: task.id,
            system: true,
            type_message: 'back_charge',
            id_line_task: id,
            title: title,
            budget: budget,
            type_line: type_line,
            status: status,
            suggestion_id: task.suggestion_id,
            budget_task: task.budget,
            total: task.total_sum
        )
        feed = FeedNotification.create(notification_type: 'new_message', task_id: task.id, task_title: task.title,
                                       message: "Back Charge", task_owner_id: task.owner_id,
                                       suggestion_id: task.suggestion_id, user_id: task.concierge_id)

        if feed.save!
          NotificationsWorker.perform_async(feed.id)
        end
      end
    end

  end

  def push_mess
    if saved_change_to_status?
      if type_line == "Change Order"
        if status == 'confirmed'
          task.generate_pdf_change_order(self) if task
          UserMailer.send_change_order(task.concierge.email, self.id, task.title).deliver
          mess = Message.find_by_id_line_task(id)
          mess.update(status: 'confirmed') if mess
          Message.create(
              author_id: task.concierge.id,
              recipient_id: task.owner.id,
              message_body: "Budget has changed",
              task_id: task.id,
              system: true,
              type_message: 'accept_line',
              id_line_task: id,
              title: title,
              budget: budget,
              type_line: type_line,
              status: status,
              suggestion_id: task.suggestion_id,
              budget_task: task.budget,
              total: (task.total_sum - budget)
          )
          feed = FeedNotification.create(notification_type: 'new_message', task_id: task.id, task_title: task.title,
                                         message: "Budget has changed", task_owner_id: task.owner_id,
                                         suggestion_id: task.suggestion_id, user_id: task.owner_id)

          if feed.save!
            NotificationsWorker.perform_async(feed.id)
          end
        end
      end
    end
  end
#"tatyanakipot@yahoo.com"
end
