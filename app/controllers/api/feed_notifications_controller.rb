class Api::FeedNotificationsController < Api::ApiController

  def add_device
    @device = Device.find_by(:token => params.require(:device).permit('token')[:token])

    if @device.present?
      @device.owner = current_resource_owner
      return head :ok if @device.save
    else
      @device = Device.create(device_params)
      return head :created if @device.save
    end

    respond_with @device
  end

  private

  def device_params
    params.require(:device).permit('token').tap do |whitelisted|
      whitelisted[:owner] = current_resource_owner
    end
  end
end
