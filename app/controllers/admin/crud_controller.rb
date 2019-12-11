class Admin::CrudController < Admin::AdminController

  before_action :set_class_name
  before_action :set_entity, only: [:show, :edit, :update, :destroy]

  def index
    @q = Kernel.const_get(@class_name).search(params[:q])
    @entities = @q.result.page(params[:page]).per(params[:per_page])
  end

  def show
  end

  def new
    @entity = Kernel.const_get(@class_name).new
  end

  def edit
  end

  def create
    @entity = Kernel.const_get(@class_name).new(entity_params)
    if @entity.save
      redirect_to url_for(:action => :index), notice: "#{@class_name} was successfully created."
    else
      render :new
    end
  end

  def update
    if @entity.update(entity_params)
      redirect_to url_for(:action => :index), notice: "#{@class_name} was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @entity.destroy
    redirect_to url_for(:action => :index), notice: "#{@class_name} was successfully deleted."
  end

  private

  def set_class_name
    raise 'method missing'
  end

  def set_entity
    @entity = Kernel.const_get(@class_name).find(params[:id])
  end

  def entity_params
    raise 'method missing'
  end

end
