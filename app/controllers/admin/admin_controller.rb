class Admin::AdminController < ActionController::Base

  include Pundit
  before_action :set_paper_trail_whodunnit

  #rescue_from Exception, :with => :render_404
  #rescue_from ActionController::RoutingError, :with => :render_404
  #rescue_from ActiveRecord::RecordNotFound, :with => :render_404
  #rescue_from ActionController::ParameterMissing, :with => :render_404

  protect_from_forgery with: :exception

  before_action :auth_admin

  layout "admin"


  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to '/admin/errors/no_perm', notice: exception.message }
      format.js { head :forbidden, content_type: 'text/html' }
    end
  end

  rescue_from Pundit::NotAuthorizedError, with: :render_422

  private

  def render_404(exception = nil)
    redirect_to '/admin/errors/error_404'
  end

  def render_422
    render 'admin/error_422' and return
  end


  def auth_admin
    warden.authenticate! scope: :user
    authorize :AdminPanel, :index?
  end


end
