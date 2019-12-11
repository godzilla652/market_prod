require "application_system_test_case"

class EstimatorTypesTest < ApplicationSystemTestCase
  setup do
    @estimator_type = estimator_types(:one)
  end

  test "visiting the index" do
    visit estimator_types_url
    assert_selector "h1", text: "Estimator Types"
  end

  test "creating a Estimator type" do
    visit estimator_types_url
    click_on "New Estimator Type"

    check "Active" if @estimator_type.active
    fill_in "Admin descr", with: @estimator_type.admin_descr
    fill_in "Email", with: @estimator_type.email
    fill_in "Name", with: @estimator_type.name
    check "Standard field" if @estimator_type.standard_field
    check "Widget" if @estimator_type.widget
    click_on "Create Estimator type"

    assert_text "Estimator type was successfully created"
    click_on "Back"
  end

  test "updating a Estimator type" do
    visit estimator_types_url
    click_on "Edit", match: :first

    check "Active" if @estimator_type.active
    fill_in "Admin descr", with: @estimator_type.admin_descr
    fill_in "Email", with: @estimator_type.email
    fill_in "Name", with: @estimator_type.name
    check "Standard field" if @estimator_type.standard_field
    check "Widget" if @estimator_type.widget
    click_on "Update Estimator type"

    assert_text "Estimator type was successfully updated"
    click_on "Back"
  end

  test "destroying a Estimator type" do
    visit estimator_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Estimator type was successfully destroyed"
  end
end
