class Admin::RolesController < Admin::AdminController

  def index
    @roles = Role.all
    @new_role = Role.new
  end

  def create
    @new_role = Role.create permitted_params
    @new_role.recreate_permissions
  end

  def destroy
    role = Role.find params[:id]
    role.destroy
    redirect_back fallback_location: admin_roles_path
  end

  private

  def permitted_params
    params.require(:role).permit :name
  end

end
