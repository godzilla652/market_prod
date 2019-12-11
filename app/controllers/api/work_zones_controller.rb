class Api::WorkZonesController < Api::ApiController

  def index
    work_zones = WorkZone.all
    render json: WorkZoneBlueprint.render(work_zones)
  end

end
