require 'test_helper'

class EstimatorTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @estimator_type = estimator_types(:one)
  end

  test "should get index" do
    get estimator_types_url
    assert_response :success
  end

  test "should get new" do
    get new_estimator_type_url
    assert_response :success
  end

  test "should create estimator_type" do
    assert_difference('EstimatorType.count') do
      post estimator_types_url, params: { estimator_type: { active: @estimator_type.active, admin_descr: @estimator_type.admin_descr, email: @estimator_type.email, name: @estimator_type.name, standard_field: @estimator_type.standard_field, widget: @estimator_type.widget } }
    end

    assert_redirected_to estimator_type_url(EstimatorType.last)
  end

  test "should show estimator_type" do
    get estimator_type_url(@estimator_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_estimator_type_url(@estimator_type)
    assert_response :success
  end

  test "should update estimator_type" do
    patch estimator_type_url(@estimator_type), params: { estimator_type: { active: @estimator_type.active, admin_descr: @estimator_type.admin_descr, email: @estimator_type.email, name: @estimator_type.name, standard_field: @estimator_type.standard_field, widget: @estimator_type.widget } }
    assert_redirected_to estimator_type_url(@estimator_type)
  end

  test "should destroy estimator_type" do
    assert_difference('EstimatorType.count', -1) do
      delete estimator_type_url(@estimator_type)
    end

    assert_redirected_to estimator_types_url
  end
end
