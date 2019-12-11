class Admin::SettingsController < Admin::AdminController
  #load_and_authorize_resource

  def index
    authorize :Setting, :index?
    @settings = SettingsListService.call
  end

  def edit
    authorize :Setting, :edit?
  end

  def settings_estimator
    @settings = SettingsListService.call
  end

  def settings_chs
    @settings = SettingsListService.call
  end

  def update
    if Settings[params[:id]] != params[:setting][:value]
      data = YAML.load_file "config/application.yml"
      data[Rails.env][params[:id]] = params[:setting][:value]
      File.open("config/application.yml", 'w') { |f| YAML.dump(data, f) }
      Settings[params[:id]] = params[:setting][:value]
      flash[:notice] = 'Setting has been updated'
    end
    redirect_to admin_settings_path
  end
end
