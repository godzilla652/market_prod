class Admin::EquipmentController <  Admin::AdminController
  before_action :set_equipment, only: [:show, :edit, :update, :destroy]


  # GET /equipment
  # GET /equipment.json
  def index
    @equipments = Equipment.all
    @equipment = Equipment.new


    #modal window
    @contracts = Contract.approved
    #@init_contract = @contracts.first
    @init_contract = User.find(122).contract
    @init_contract_id = @init_contract.id
    @init_equipments = @init_contract.equipments

    

  end

  # GET /equipment/1
  # GET /equipment/1.json
  def show
    respond_to do |format|
      format.html
      format.js {}
      format.json
    end
  end

  # GET /equipment/new
  def new
    @equipment = Equipment.new
  end

  # GET /equipment/1/edit
  def edit
  end

  # POST /equipment
  # POST /equipment.json
  def create
    @equipment = Equipment.new(equipment_params)

    respond_to do |format|
      if @equipment.save
        format.html { redirect_to admin_equipment_index_url, notice: 'Equipment was successfully created.' }
        format.json { render :show, status: :created, location: @equipment }
      else
        format.html { render :new }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equipment/1
  # PATCH/PUT /equipment/1.json
  def update
    respond_to do |format|
      if @equipment.update(equipment_params)
        format.html { redirect_to admin_equipment_index_url, notice: 'Equipment was successfully updated.' }
        format.json { render :show, status: :ok, location: @equipment }
      else
        format.html { render :edit }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipment/1
  # DELETE /equipment/1.json
  def destroy
    @equipment.destroy
    respond_to do |format|
      format.html { redirect_to admin_equipment_index_url, notice: 'Equipment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipment
      @equipment = Equipment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def equipment_params
      params.require(:equipment).permit(:name, :category_id, :description, :total_owned, :available, :assigned, :damaged,
                                        :main_image)
    end
end
