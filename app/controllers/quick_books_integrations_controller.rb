class QuickBooksIntegrationsController < ActionController::Base
  def callback
    QuickBooks::CallbackProcessor.new(params).process
    redirect_to root_path
  end

  def index
    auth_uri = QuickBooks::AuthClient.new.build_auth_uri
    redirect_to auth_uri
  end
end