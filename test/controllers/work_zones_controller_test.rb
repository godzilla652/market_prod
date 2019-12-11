require 'test_helper'

class WorkZonesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @work_zone = work_zones(:one)
  end

  test "should get index" do
    get work_zones_url
    assert_response :success
  end

  test "should get new" do
    get new_work_zone_url
    assert_response :success
  end

  test "should create work_zone" do
    assert_difference('WorkZone.count') do
      post work_zones_url, params: { work_zone: { name: @work_zone.name, spot_four: @work_zone.spot_four, spot_one: @work_zone.spot_one, spot_three: @work_zone.spot_three, spot_two: @work_zone.spot_two } }
    end

    assert_redirected_to work_zone_url(WorkZone.last)
  end

  test "should show work_zone" do
    get work_zone_url(@work_zone)
    assert_response :success
  end

  test "should get edit" do
    get edit_work_zone_url(@work_zone)
    assert_response :success
  end

  test "should update work_zone" do
    patch work_zone_url(@work_zone), params: { work_zone: { name: @work_zone.name, spot_four: @work_zone.spot_four, spot_one: @work_zone.spot_one, spot_three: @work_zone.spot_three, spot_two: @work_zone.spot_two } }
    assert_redirected_to work_zone_url(@work_zone)
  end

  test "should destroy work_zone" do
    assert_difference('WorkZone.count', -1) do
      delete work_zone_url(@work_zone)
    end

    assert_redirected_to work_zones_url
  end
end
