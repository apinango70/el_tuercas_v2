require "application_system_test_case"

class ServicesTest < ApplicationSystemTestCase
  setup do
    @service = services(:one)
  end

  test "visiting the index" do
    visit services_url
    assert_selector "h1", text: "Services"
  end

  test "should create service" do
    visit services_url
    click_on "New service"

    fill_in "Deadline", with: @service.deadline
    fill_in "Service name", with: @service.service_name
    fill_in "Spare parts", with: @service.spare_parts
    fill_in "Status", with: @service.status
    fill_in "Vehicle", with: @service.vehicle_id
    click_on "Create Service"

    assert_text "Service was successfully created"
    click_on "Back"
  end

  test "should update Service" do
    visit service_url(@service)
    click_on "Edit this service", match: :first

    fill_in "Deadline", with: @service.deadline
    fill_in "Service name", with: @service.service_name
    fill_in "Spare parts", with: @service.spare_parts
    fill_in "Status", with: @service.status
    fill_in "Vehicle", with: @service.vehicle_id
    click_on "Update Service"

    assert_text "Service was successfully updated"
    click_on "Back"
  end

  test "should destroy Service" do
    visit service_url(@service)
    click_on "Destroy this service", match: :first

    assert_text "Service was successfully destroyed"
  end
end
