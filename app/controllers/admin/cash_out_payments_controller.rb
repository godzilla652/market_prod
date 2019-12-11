class Admin::CashOutPaymentsController < Admin::CrudController

  def index
    @q = CashOutPayment.search()
    @entities = @q.result.order(id: :desc).page(params[:page]).per(params[:per_page])
  end

  def transaction
    payment = CashOutPayment.find(params[:cash_out_payment_id])
    payment.stripe_payout
    redirect_to action: :index
  end

  def set_class_name
    @class_name = 'CashOutPayment'
  end
end
