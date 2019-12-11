class Admin::WorkZonesController < Admin::AdminController
  before_action :set_work_zone, only: [:show, :edit, :update, :destroy]
  # load_and_authorize_resource :only => [:show, :edit, :update, :destroy, :index]

  # GET /work_zones
  # GET /work_zones.json
  def index
    @work_zones = WorkZone.all
    @work_zone = WorkZone.new
  end

  # GET /work_zones/1
  # GET /work_zones/1.json
  def show
  end

  # GET /work_zones/new
  def new
    @work_zone = WorkZone.new
  end

  # GET /work_zones/1/edit
  def edit
  end

  # POST /work_zones
  # POST /work_zones.json
  def create
    @work_zone = WorkZone.new(work_zone_params)

    respond_to do |format|
      if @work_zone.save
        @success = true
        format.html { redirect_to '/admin/tracker', notice: 'Work zone was successfully created.' }
        format.json { render :show, status: :created, location: @work_zone }
        format.js
      else
        format.html { render :new }
        format.json { render json: @work_zone.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /work_zones/1
  # PATCH/PUT /work_zones/1.json
  def update
    respond_to do |format|
      if @work_zone.update(work_zone_params)
        @success = true
        format.html { redirect_to admin_work_zones_url, notice: 'Work zone was successfully updated.' }
        format.json { render :show, status: :ok, location: @work_zone }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @work_zone.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /work_zones/1
  # DELETE /work_zones/1.json
  def destroy
    @work_zone.destroy
    respond_to do |format|
      format.html { redirect_to admin_work_zones_url, notice: 'Work zone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_work_zone
    @work_zone = WorkZone.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def work_zone_params
    params.require(:work_zone).permit(:name, :spot_one, :spot_two, :spot_three, :spot_four)
  end
end
