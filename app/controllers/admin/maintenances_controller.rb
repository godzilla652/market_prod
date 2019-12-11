class Admin::MaintenancesController < Admin::AdminController
  before_action :set_vehicle, only: %i(index create)
  before_action :set_maintenance, only: %i[update destroy]

  # GET /admin/vehicles/:vehicle_id/maintenances
  def index
    @maintenances = @vehicle.maintenances
    respond_to do |format|
      format.js {}
    end
  end

  # GET /admin/vehicles/:vehicle_id/maintenances/new
  def new
    @maintenance = @vehicle.maintenances.build
  end

  def create
    @maintenance = @vehicle.maintenances.build(maintenance_params)
    @maintenance.contractor_name = @vehicle&.contract&.full_name || 'Unassigned'
    respond_to do |format|
      if @maintenance.save
        format.html { redirect_to admin_vehicles_url, notice: 'Maintenance was successfully created.' }
        format.js {}
        format.json { render json: { vehicle: @vehicle } }
      else
        format.html { render :new }
        format.json { render json: @maintenance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/maintenances/:id
  def update
    respond_to do |format|
      if @maintenance.update(maintenance_params)
        format.html {  }
        format.js {}
        format.json { render json: { vehicle: @vehicle } }
      else
        format.html { redirect_to admin_vehicles_url, @maintenance.errors, status: :unprocessable_entity }
        format.json { render json: @maintenance.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @maintenance.destroy
    respond_to do |format|
      format.html { redirect_to redirect_link(id), notice: 'Project task was successfully destroyed.' }
      format.js {}
      format.json { head :no_content }
    end
  end

  private

  def set_vehicle
    @vehicle = Vehicle.find(params[:vehicle_id])
  end

  def set_maintenance
    @maintenance = Maintenance.find_by(id: params[:id])
  end

  def maintenance_params
    params.require(:maintenance).permit(:date, :title, :done)
  end
end
