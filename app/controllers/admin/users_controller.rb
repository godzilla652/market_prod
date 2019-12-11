class Admin::UsersController < Admin::CrudController

  # load_and_authorize_resource except: [:index, :edit_role, :update_role]
  before_action :fetch_user, only: [:edit_role, :update_role]

  def authenticate_admin
    redirect_to new_user_session_path unless user_signed_in?
    redirect_to root_path if user_signed_in? && !(current_user.admin?)
  end

  def index
    if params[:type_work] || params[:city]
      @q = Contract.where(status: :approved, team: [nil, false]).search(type_work_cont: params[:type_work],
                                                                        city_cont: params[:city])
      @users = @q.result.map { |e| e.user }
      render 'api/users/contractors'
    else
      @q = User.distinct.search(params[:q])
      @entities = @q.result.page(params[:page]).per(params[:per_page])
    end
  end

  def tracker
    authorize :Tracker, :index?
    @work_zone = WorkZone.new
  end

  def time_tracker
    authorize :Tracker, :index?
    @q = WorkZoneVisitLog.eager_load(:user, :work_zone).ransack(params[:q])
    work_zone_visit_logs = @q.result(distinct: true)
    grouped_logs = work_zone_visit_logs.group_by {|log| [log.user, log.work_zone, log.date]}
    @logs = grouped_logs.map do |(user, work_zone, date), logs|
      WorkZoneVisitLogRecord.new user: user, work_zone: work_zone, date: date, logs: logs
    end
  end

  def update
    @entity = User.find(params[:id])
    @entity.update_attribute(:blocked_to, Time.now + params[:user][:blocked_to].to_i.days) if params[:user][:blocked_to].present?
    @entity.update_attribute(:blocked_to, Time.now - 1.days) if params[:unblock]

    blocked_to = @entity.blocked_to.strftime("%m-%d-%Y   %I:%M%p")
    current_server_time = Time.now.strftime("%m-%d-%Y   %I:%M%p")

    feed = FeedNotification.create(message: "{blocked_to: '#{blocked_to}', current_server_time: '#{current_server_time}'}", notification_type: 'profile_changes', user_id: @entity.id)
    if feed.save!
      NotificationsWorker.perform_async(feed.id)
    end

    render 'admin/users/show'
  end

  def edit_role
    @models = PermissionsConstants::MODELS
    @role = params[:role_id] ? Role.where(id: params[:role_id]).first_or_initialize : (@user.role || Role.new)
  end

  def update_role
    @user.update params[:user].permit(:role_id, role_attributes: [:id, :name, permissions_attributes: [:id, :active, :subject_class, :action]])
  end

  private

  def fetch_user
    @user = User.find params[:id]
  end

  def set_class_name
    @class_name = 'User'
  end

  def entity_params
    params.require(:user).permit(:blocked_to)
  end
end
