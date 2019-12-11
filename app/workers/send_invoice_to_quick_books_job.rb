class SendInvoiceToQuickBooksJob
  include Sidekiq::Worker

  def perform(task_id)
    task = Task.find(task_id)
    QuickBooks::InvoiceCreator.new(task).create
  end
end
