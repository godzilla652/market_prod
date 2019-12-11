class Admin::EstimatorTypesController < Admin::AdminController
  before_action :set_estimator_type, only: [:show, :edit, :update, :destroy, :add_field, :export, :destroy_field,
                                            :edit_field, :display_views]
  before_action :field_params, only: [:add_field, :edit_field]
  before_action :set_display_view, only: [:display_views]

  # GET /estimator_types
  # GET /estimator_types.json
  def index
    authorize :Setting, :index?
    @estimator_types = EstimatorType.all
  end

  def export; end

  def estimator_types_import
    if params[:import].present?
      EstimatorType.import_all(params[:import])
      redirect_to admin_estimator_types_url
    end

  end

  def display_views
    if params[:add_line_dv].present?
      LineDv.create(name: params[:add_line_dv][:name], type_line: 'group', calc: true, display_view_id: @display_view.id,
                    line_dv_id: params[:add_line_dv][:line_dv_id])
      redirect_to admin_estimator_types_display_views_url(@estimator_type, @display_view.id)
    end
    if params[:select_line].present?
      item = ItemLineDv.find_by(field_estimator_id: params[:select_line][:field_estimator_id])
      if item.present?
        item.update(line_dv_id: params[:select_line][:line_dv_id])
      else
        ItemLineDv.create(field_estimator_id: params[:select_line][:field_estimator_id], line_dv_id: params[:select_line][:line_dv_id])
      end
      redirect_to admin_estimator_types_display_views_url(@estimator_type, @display_view.id)
    end
    @ids = @estimator_type.item_line_dvs.map{|e| e.field_estimator_id}
  end

  # GET /estimator_types/1
  # GET /estimator_types/1.json
  def show
    authorize :Setting, :show?
    @fields = FieldEstimator.all
  end

  # GET /estimator_types/new
  def new
    authorize :Setting, :new?
    @estimator_type = EstimatorType.new
  end

  # GET /estimator_types/1/edit
  def edit
    authorize :Setting, :edit?
  end

  def add_field
    field = FieldEstimator.new(field_params)
    field.save
    redirect_to [:admin, @estimator_type]
  end

  def update_field
    @field = FieldEstimator.find(params[:id_field])
    @estimator_type = @field.fieldable
  end

  def edit_field
    field = FieldEstimator.find(params[:id_field])
    field.update(field_params)
    redirect_to [:admin, @estimator_type]
  end

  def destroy_field
    field = FieldEstimator.find(params[:id_field])
    field.destroy if field.present?
    redirect_to [:admin, @estimator_type]
  end

  # POST /estimator_types
  # POST /estimator_types.json
  def create
    authorize :Setting, :create?
    @estimator_type = EstimatorType.new(estimator_type_params)

    respond_to do |format|
      if @estimator_type.save
        format.html { redirect_to [:admin, @estimator_type], notice: 'Estimator type was successfully created.' }
        format.json { render :show, status: :created, location: @estimator_type }
      else
        format.html { render :new }
        format.json { render json: @estimator_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estimator_types/1
  # PATCH/PUT /estimator_types/1.json
  def update
    respond_to do |format|
      if @estimator_type.update(estimator_type_params)
        format.html { redirect_to [:admin, @estimator_type], notice: 'Estimator type was successfully updated.' }
        format.json { render :show, status: :ok, location: @estimator_type }
      else
        format.html { render :edit }
        format.json { render json: @estimator_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estimator_types/1
  # DELETE /estimator_types/1.json
  def destroy
    @estimator_type.destroy
    respond_to do |format|
      format.html { redirect_to admin_estimator_types_url, notice: 'Estimator type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estimator_type
      @estimator_type = EstimatorType.find(params[:id])
    end

    def set_display_view
      @display_view = DisplayView.find(params[:id_dv])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estimator_type_params
      params.require(:estimator_type).permit(:name, :admin_descr, :active, :widget, :standard_field, :email, :admin_dv)
    end

    def field_params
      params.require(:field).permit(:name, :name_scope, :machine_name, :type_field, :astra_price, :astra_price, :trade_price,
                                    :fieldable_id, :fieldable_type, :active, :desc, :default_value, :ancestry, :required,
                                    :multiple, :style_cls, :field_estimator_id, :depend_id, :dv_name, option: [:dependent_id,
                                    :plus_value, :plus_type, :plus_only, :value_only, :percent_only, :calculation,
                                    :hide_front, :hide_admin_list_task, :horizont_class, :add_each_to_addict])
    end
end
