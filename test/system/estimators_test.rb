require "application_system_test_case"

class EstimatorsTest < ApplicationSystemTestCase
  setup do
    @estimator = estimators(:one)
  end

  test "visiting the index" do
    visit estimators_url
    assert_selector "h1", text: "Estimators"
  end

  test "creating a Estimator" do
    visit estimators_url
    click_on "New Estimator"

    check "Accessory" if @estimator.accessory
    fill_in "Address", with: @estimator.address
    fill_in "City", with: @estimator.city
    check "Cleanfinal" if @estimator.cleanfinal
    fill_in "Closet door", with: @estimator.closet_door
    fill_in "Comment", with: @estimator.comment
    fill_in "Door", with: @estimator.door
    fill_in "Email", with: @estimator.email
    fill_in "Light", with: @estimator.light
    fill_in "Name", with: @estimator.name
    check "New kitch" if @estimator.new_kitch
    check "Paint new kitch" if @estimator.paint_new_kitch
    fill_in "Phone", with: @estimator.phone
    fill_in "Receptacle", with: @estimator.receptacle
    fill_in "Sqft", with: @estimator.sqft
    fill_in "Stair", with: @estimator.stair
    check "Surround" if @estimator.surround
    check "Toilet" if @estimator.toilet
    check "Vanity" if @estimator.vanity
    click_on "Create Estimator"

    assert_text "Estimator was successfully created"
    click_on "Back"
  end

  test "updating a Estimator" do
    visit estimators_url
    click_on "Edit", match: :first

    check "Accessory" if @estimator.accessory
    fill_in "Address", with: @estimator.address
    fill_in "City", with: @estimator.city
    check "Cleanfinal" if @estimator.cleanfinal
    fill_in "Closet door", with: @estimator.closet_door
    fill_in "Comment", with: @estimator.comment
    fill_in "Door", with: @estimator.door
    fill_in "Email", with: @estimator.email
    fill_in "Light", with: @estimator.light
    fill_in "Name", with: @estimator.name
    check "New kitch" if @estimator.new_kitch
    check "Paint new kitch" if @estimator.paint_new_kitch
    fill_in "Phone", with: @estimator.phone
    fill_in "Receptacle", with: @estimator.receptacle
    fill_in "Sqft", with: @estimator.sqft
    fill_in "Stair", with: @estimator.stair
    check "Surround" if @estimator.surround
    check "Toilet" if @estimator.toilet
    check "Vanity" if @estimator.vanity
    click_on "Update Estimator"

    assert_text "Estimator was successfully updated"
    click_on "Back"
  end

  test "destroying a Estimator" do
    visit estimators_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Estimator was successfully destroyed"
  end
end
