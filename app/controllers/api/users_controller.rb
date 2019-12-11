class Api::UsersController < Api::ApiController

  def sign_in
    if params[:facebook_token].present?
      @user = User.get_by_fbtoken(params[:facebook_token])
    else
      @user = User.find_for_database_authentication(:email => params[:email])
      unless @user.present? && @user.valid_password?(params[:password])
        return render :json => {errors: {email: ['Invalid email/password combination.']}}, :status => :unauthorized

      end
    end
    if @user.blocked_to?
      return render :json => {errors: {email: ['You blocked!']}}, :status => :unauthorized
    else
      @access_token = Oauth::AccessToken.create(:application_id => application.id, :resource_owner_id => @user.id)

      @current_user = @user
      if params[:web] == 'true'
        #byebug
        @current_user.update(is_logged_in: true, token_web: @access_token.token)
      end
      return render 'api/users/create'
    end

  end

  def update_description
    @user = current_resource_owner
    @user.update_attribute(:description, params[:description])
    render 'api/users/show'
  end

  def me
    @user = current_resource_owner
  end

  def contractors
    if params[:q].present?
      @q = Contract.where(status: :approved, team: [nil, false]).search(params[:q])
      @users = @q.result.map { |e| e.user }

    else
      @users = Contract.where(status: :approved, team: [nil, false]).map { |e| e.user }
    end

  end

  def show
    @user = User.find(params[:id])
    render 'api/users/me'
  end

  def me_update

    @user = current_resource_owner

    if params[:user][:password].present? && !current_resource_owner.valid_password?(params[:user][:current_password])
      @user.errors.add(:current_password, 'is wrong')
      return respond_with @user
    else
      @user.update(user_params)
    end

    return render 'api/users/show' if @user.save

    respond_with @user
  end

  def token_active
    @user = User.find_by(email: params[:email])
    if @user.present?
      if params[:token_web].present?
        if @user.token_web == params[:token_web]
          render json: {status: 'true'}, status: 200
        else
          render json: {status: 'false'}, status: 200
        end
      else
        render json: {status: 'false'}, status: 200
      end
    end

  end

  def sign_up
    @user = User.create!(user_params)
    if @user.save
      @access_token = Oauth::AccessToken.create!(:application_id => application.id, :resource_owner_id => @user.id)
      return render 'api/users/create'
    else
      render :json => {errors: {message: ["Email is invalid"]}}, status: 500
    end
    respond_with @user
  end

  def reset_password
    params.require(:email)
    @user = User.where("lower(email) = ?", params[:email].downcase).first

    if @user.nil?
      return render :json => {errors: {exception: ['User with this email has not found']}}, :status => 404
    else
      @user.send_reset_password_instructions()
    end

    return head :no_content
  end

  def up_balance
    current_resource_owner.update_attribute(
        :balance, current_resource_owner.balance + params[:balance][:amount].to_i
    )
    payment_type = "pay_pal"
    if params[:balance][:stripe_token].present?
      current_resource_owner.stripe_payment?(params[:balance][:stripe_token], params[:balance][:amount])
      payment_type = "stripe"
    end
    task_payment = TaskPayment.new(user_id: current_resource_owner.id, hire: true, budget: params[:balance][:amount], persents: 0.0, payment_method: payment_type)
    task_payment.save
    render :json => {message: ['ok']}, :status => 200
  end

  private

  def application
    raise 'Required client_id and client_secret' unless params['client_id'].present? && params['client_secret'].present?
    application = Oauth::Application.find_by({:uid => params['client_id'], :secret => params['client_secret']})
    raise 'Application not found' if application.nil?
    application
  end

  def user_params
    params.require(:user).permit(
        :email, :password, :first_name, :last_name, :user_name,
        :city, :street, :country_id, :photo, :cardholder_name,
        :card_number, :cvk, :exp_month, :exp_year, :postal_code,
        :phone1, :phone2
    )
  end
end
