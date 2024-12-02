require "application_system_test_case"

class HelpRequestsTest < ApplicationSystemTestCase
  setup do
    @help_request = help_requests(:one)
  end

  test "visiting the index" do
    visit help_requests_url
    assert_selector "h1", text: "Help requests"
  end

  test "should create help request" do
    visit help_requests_url
    click_on "New help request"

    fill_in "Message", with: @help_request.message
    fill_in "Title", with: @help_request.title
    fill_in "User", with: @help_request.user_id
    click_on "Create Help request"

    assert_text "Help request was successfully created"
    click_on "Back"
  end

  test "should update Help request" do
    visit help_request_url(@help_request)
    click_on "Edit this help request", match: :first

    fill_in "Message", with: @help_request.message
    fill_in "Title", with: @help_request.title
    fill_in "User", with: @help_request.user_id
    click_on "Update Help request"

    assert_text "Help request was successfully updated"
    click_on "Back"
  end

  test "should destroy Help request" do
    visit help_request_url(@help_request)
    click_on "Destroy this help request", match: :first

    assert_text "Help request was successfully destroyed"
  end
end
