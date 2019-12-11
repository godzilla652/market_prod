class Api::CashOutPaymentsController < Api::ApiController

  def index
    @q = TaskSuggestion.search(task_id_eq: params[:id])
    @entities = @q.result.order(id: :desc).page(params[:page]).per(params[:per_page])
  end

end
