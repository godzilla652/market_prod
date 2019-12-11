require 'test_helper'

class EstimatorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @estimator = estimators(:one)
  end

  test "should get index" do
    get estimators_url
    assert_response :success
  end

  test "should get new" do
    get new_estimator_url
    assert_response :success
  end

  test "should create estimator" do
    assert_difference('Estimator.count') do
      post estimators_url, params: { estimator: { accessory: @estimator.accessory, address: @estimator.address, city: @estimator.city, cleanfinal: @estimator.cleanfinal, closet_door: @estimator.closet_door, comment: @estimator.comment, door: @estimator.door, email: @estimator.email, light: @estimator.light, name: @estimator.name, new_kitch: @estimator.new_kitch, paint_new_kitch: @estimator.paint_new_kitch, phone: @estimator.phone, receptacle: @estimator.receptacle, sqft: @estimator.sqft, stair: @estimator.stair, surround: @estimator.surround, toilet: @estimator.toilet, vanity: @estimator.vanity } }
    end

    assert_redirected_to estimator_url(Estimator.last)
  end

  test "should show estimator" do
    get estimator_url(@estimator)
    assert_response :success
  end

  test "should get edit" do
    get edit_estimator_url(@estimator)
    assert_response :success
  end

  test "should update estimator" do
    patch estimator_url(@estimator), params: { estimator: { accessory: @estimator.accessory, address: @estimator.address, city: @estimator.city, cleanfinal: @estimator.cleanfinal, closet_door: @estimator.closet_door, comment: @estimator.comment, door: @estimator.door, email: @estimator.email, light: @estimator.light, name: @estimator.name, new_kitch: @estimator.new_kitch, paint_new_kitch: @estimator.paint_new_kitch, phone: @estimator.phone, receptacle: @estimator.receptacle, sqft: @estimator.sqft, stair: @estimator.stair, surround: @estimator.surround, toilet: @estimator.toilet, vanity: @estimator.vanity } }
    assert_redirected_to estimator_url(@estimator)
  end

  test "should destroy estimator" do
    assert_difference('Estimator.count', -1) do
      delete estimator_url(@estimator)
    end

    assert_redirected_to estimators_url
  end
end
