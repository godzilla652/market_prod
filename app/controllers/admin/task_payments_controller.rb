class Admin::TaskPaymentsController < Admin::CrudController

  def index
    @q = TaskPayment.distinct.search(params[:q])
    @entities = @q.result.page(params[:page]).per(params[:per_page])
  end

  private

  def set_class_name
    @class_name = 'TaskPayment'
  end
end
