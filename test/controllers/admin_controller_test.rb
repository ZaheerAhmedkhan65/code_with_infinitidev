require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers   # This includes Devise helpers

  setup do
    @admin_user = users(:admin)
    @student_user = users(:student)
  end

  test "should get dashboard as admin" do
    sign_in @admin_user
    get admin_dashboard_url
    assert_response :success
  end

  test "should not get dashboard as student" do
    sign_in @student_user
    get admin_dashboard_url
    assert_redirected_to root_path
    assert_equal "Access denied!", flash[:alert]
  end

  test "should get index as admin" do
    sign_in @admin_user
    get admin_index_url
    assert_response :success
  end

  test "should not get index as student" do
    sign_in @student_user
    get admin_index_url
    assert_redirected_to root_path
    assert_equal "Access denied!", flash[:alert]
  end
end
