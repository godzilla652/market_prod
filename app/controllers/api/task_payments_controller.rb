class Api::TaskPaymentsController < Api::ApiController

  def cashout
    authorize CashOutPayment, :create?

    unless @current_user.balance == 0
      #ppal_email = @current_user.ppal_email(params[:token])

      amount = @current_user.balance - ((@current_user.balance * 12.5) / 100)
      persents = (@current_user.balance * 12.5) / 100
      cash_out = CashOutPayment.create(user_id: @current_user.id, amount: amount, persents: persents, pay_system: 'stripe', card_number: params[:token]) #, ppal_email: ppal_email)

      if cash_out.save
        @current_user.update_attribute(:balance, 0)
        puts params[:token]
        render :json => {message: ['ok']}, :status => 200
      end
    end
  end

  def hire_payments
    authorize TaskPayment, :index?

    @entities = {}

    @q = TaskPayment.search(user_id_in: @current_user.id, hire_eq: true)
    payments = @q.result.order(id: :desc).page(params[:page]).per(params[:per_page])

    @entities[:payments] = payments unless payments.nil?
    @entities[:account_balance] = @current_user.balance
    @entities[:amount] = @current_user.total('hire')

    @entities
    render 'api/task_payments/index'
  end

  def concierge_payments
    authorize TaskPayment, :index?

    @entities = {}

    @q = TaskPayment.search(user_id_in: @current_user.id, concierge_eq: true)
    payments = @q.result.order(id: :desc).page(params[:page]).per(params[:per_page])

    @entities[:payments] = payments unless payments.nil?
    @entities[:account_balance] = @current_user.balance
    @entities[:amount] = @current_user.total('concierge')

    @entities
    render 'api/task_payments/index'
  end

  def cashouts_lis
    authorize CashOutPayment, :index?

    @entities = {}

    @q = CashOutPayment.search(user_id_in: @current_user.id)
    payments = @q.result.order(id: :desc).page(params[:page]).per(params[:per_page])
    @entities[:payments] = payments unless payments.nil?
    @entities[:account_balance] = @current_user.balance
    @entities[:amount] = @current_user.cash_out_amount

    render 'api/cash_out_payments/index'
  end
end
