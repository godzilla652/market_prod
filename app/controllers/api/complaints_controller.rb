class Api::ComplaintsController < Api::ApiController

  def create
    @entity = Complaint.new(complain_params)
    unless @entity.invalid_recipiend?(current_resource_owner)
      if @entity.save
        render :json => {message: ['ok']}, :status => 200
      end
    else
      render :json => {message: ["you can't create a complaint to myself"]}, :status => 500
    end
  end

  private

  def complain_params
    params.require(:complaint).permit(:user_id, :complaint_types, :description, :task_id).tap do |param|
      param[:owner] = current_resource_owner
    end
  end
end
