class Admin::AssignsController < Admin::AdminController

  before_action :set_contract, except: :update_equipment

  # GET /admin/assigns/:contract_id
  def show
    @available = params[:assignable_type].constantize.available
    @added = params[:assignable_type].constantize.added
    respond_to do |format|
      format.html
      format.js {}
      format.json { render json: { available: @available, added: @added, contract: @contract } }
    end
  end

  # PUT /admin/assigns/:id
  def update_equipment
    assign = Assign.find_by!(id: params[:id])
    assign.update_assignable_model if assign.update(assign_params)
    respond_to do |f|
      f.html { redirect_to admin_approved_team_url }
      f.json { render json: assign, status: :ok }
    end
  end

  # DELETE /admin/assigns/:contract_id
  def destroy
    assign = @contract.assigns.find_by!(id: params[:assign_id])
    assign.destroy if assign
    respond_to do |format|
      format.html { redirect_to admin_approved_team_url, notice: 'Successfully removed.' }
      format.json { head :no_content }
    end
  end

  # POST /admin/assigns/:contract_id/assign_item
  def assign_item
    assign = Contract.find_by!(id: params[:contract_id]).assigns.build(assign_params)
    respond_to do |f|
      if assign.save
        assign.assigned_item
        f.html { redirect_to admin_approved_team_url }
        f.json { render json: assign }
      else
        f.html { redirect_to admin_approved_team_url, notice: assign.errors }
        f.json { render json: assign.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_contract
    @contract = Contract.find_by!(id: params[:contract_id])
  end

  def assign_params
    params.permit(:assignable_type, :assignable_id, :assign_count)
  end
end
