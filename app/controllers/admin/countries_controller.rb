class Admin::CountriesController < Admin::CrudController

  def index
    @q = Country.distinct.search(params[:q])
    @entities = @q.result.page(params[:page]).per(params[:per_page])
  end

  def update
    @entity = Country.find(params[:id])
    if @entity.update(entity_params)
      redirect_to admin_countries_path(@entity), notice: 'Country was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_class_name
    @class_name = 'Country'
  end

  def entity_params
    params.require(:country).permit(:name)
  end
end
