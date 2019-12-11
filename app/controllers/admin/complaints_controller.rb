class Admin::ComplaintsController < Admin::CrudController

  def index
    @q = Complaint.distinct.search(params[:q])
    @entities = @q.result.page(params[:page]).per(params[:per_page])
  end

  def show
    @entity = Complaint.find(params[:id])
  end

  private

  def set_class_name
    @class_name = 'Complaint'
  end
end
