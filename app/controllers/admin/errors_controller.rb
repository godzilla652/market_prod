class Admin::ErrorsController < Admin::AdminController
  skip_authorize_resource
  skip_authorization_check

  def error_404

  end

  def no_perm

  end
end
