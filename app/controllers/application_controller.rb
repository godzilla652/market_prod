class ApplicationController < ActionController::Base
  add_flash_types :success, :warning, :danger, :info

  before_action :set_paper_trail_whodunnit
  protect_from_forgery with: :exception
  protect_from_forgery prepend: true


  protected
  # def after_sign_in_path_for(resource)
  #   unless current_user.admin?
  #     flash[:notice] = "Your password was changed"
  #     #return render '/devise/passwords/after_update'
  #   end
  # end
  #
  #
  # this name is more suitable

  # for cancancan

end
