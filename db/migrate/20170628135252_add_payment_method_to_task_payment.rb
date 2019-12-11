class AddPaymentMethodToTaskPayment < ActiveRecord::Migration[5.0]
  def change
    add_column :task_payments, :payment_method, :string
  end
end
