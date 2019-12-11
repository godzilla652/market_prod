class Admin::PermissionsController < Admin::AdminController
  before_action :set_permission, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  #load_and_authorize_resource
  # GET /permissions
  # GET /permissions.json
  def index
    authorize :Setting, :update?
    @models = PermissionsConstants::MODELS
    @new_role = Role.new
    @permissions = Permission.all
  end

  # GET /permissions/1
  # GET /permissions/1.json
  def show
  end

  # GET /permissions/new
  def new
    @permission = Permission.new
  end

  # GET /permissions/1/edit
  def edit
  end

  # POST /permissions
  # POST /permissions.json
  def create
    permission = Permission.where(subject_class: params[:permission][:subject_class], action: params[:permission][:action], role_id: params[:permission][:role_id]).first_or_initialize
    permission.update active: params[:permission][:active]

    # respond_to do |format|
    #   if @permission.save
    #     format.html { redirect_to @permission, notice: 'Permission was successfully created.' }
    #     format.json { render :show, status: :created, location: @permission }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @permission.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /permissions/1
  # PATCH/PUT /permissions/1.json
  # def update
  #   @permission.update(permission_params)
  #   # respond_to do |format|
  #   #   if @permission.update(permission_params)
  #   #     format.html { redirect_to [:admin, @permission], notice: 'Permission was successfully updated.' }
  #   #     format.json { render :show, status: :ok, location: [:admin, @permission] }
  #   #   else
  #   #     format.html { render :edit }
  #   #     format.json { render json: @permission.errors, status: :unprocessable_entity }
  #   #   end
  #   # end
  # end

  # DELETE /permissions/1
  # DELETE /permissions/1.json
  def destroy
    @permission.destroy
    respond_to do |format|
      format.html { redirect_to permissions_url, notice: 'Permission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_permission
    @permission = Permission.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def permission_params
    params.require(:permission).permit(:action, :subject_class, :subject_id, :role_id, :active)
  end
end
