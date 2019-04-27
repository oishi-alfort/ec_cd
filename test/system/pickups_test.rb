require "application_system_test_case"

class PickupsTest < ApplicationSystemTestCase
  setup do
    @pickup = pickups(:one)
  end

  test "visiting the index" do
    visit pickups_url
    assert_selector "h1", text: "Pickups"
  end

  test "creating a Pickup" do
    visit pickups_url
    click_on "New Pickup"

    fill_in "Cd", with: @pickup.cd_id
    fill_in "Pickup body", with: @pickup.pickup_body
    fill_in "Pickup title", with: @pickup.pickup_title
    click_on "Create Pickup"

    assert_text "Pickup was successfully created"
    click_on "Back"
  end

  test "updating a Pickup" do
    visit pickups_url
    click_on "Edit", match: :first

    fill_in "Cd", with: @pickup.cd_id
    fill_in "Pickup body", with: @pickup.pickup_body
    fill_in "Pickup title", with: @pickup.pickup_title
    click_on "Update Pickup"

    assert_text "Pickup was successfully updated"
    click_on "Back"
  end

  test "destroying a Pickup" do
    visit pickups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pickup was successfully destroyed"
  end
end
