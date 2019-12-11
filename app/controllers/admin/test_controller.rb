class Admin::TestController < Admin::AdminController
  before_action do
    ActiveStorage::Current.host = request.base_url
  end


  def test
    user_data = {}
    user_data[:name] = Contract.find(params[:contract_id]).contact_name
    user_data[:img_url] = Contract.find(params[:contract_id]).user.photo.url

    user_data[:equipments] = Contract.find(params[:contract_id]).equipments

    user_data[:equipments_category] = []
    Contract.find(params[:contract_id]).equipments.each do |contract_equipment|
      user_data[:equipments_category].push contract_equipment.category.name
    end

    user_data[:equipments_img_url] = []
    Contract.find(params[:contract_id]).equipments.each do |contract_equipment|
      user_data[:equipments_img_url].push contract_equipment.main_image.service_url
    end


    #all equipment id


    render :json => user_data
  end

end
