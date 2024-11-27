require "test_helper"

class AssignmentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  # setup do
  #   @admin_user = users(:admin)
  #   @student_user = users(:student)
  #   @student_user.avatar.attach(
  #     io: File.open(Rails.root.join("test/fixtures/files/sample_avatar.jpg")),
  #     filename: "sample_avatar.jpg",
  #     content_type: "image/jpg"
  #   )
  #   @course = courses(:course_one)
  #   @assignment = assignments(:assignment_one)
  # end

  # test "should get index as authenticated user" do
  #   sign_in @student_user
  #   get course_assignments_url(@course)
  #   assert_response :success
  # end

  # test "should get show as authenticated user" do
  #   sign_in @student_user
  #   get course_assignment_url(@course, @assignment)
  #   assert_response :success
  # end

  # test "should get new as admin" do
  #   sign_in @admin_user
  #   get new_course_assignment_url(@course)
  #   assert_response :success
  # end

  # test "should redirect new as non-admin" do
  #   sign_in @student_user
  #   get new_course_assignment_url(@course)
  #   assert_redirected_to root_path
  #   assert_equal "Access denied!", flash[:alert]
  # end

  # test "should create assignment as admin" do
  #   sign_in @admin_user
  #   post course_assignments_url(@course), params: {
  #     assignment: {
  #       title: "New Assignment",
  #       description: "Assignment Description",
  #       file: fixture_file_upload(Rails.root.join("test/fixtures/files/sample.pdf"), "application/pdf")
  #     }
  #   }
  #   assert assigns(:assignment).errors.empty?, assigns(:assignment).errors.full_messages.join(", ")
  #   assert_difference("Assignment.count", 1) do
  #     post course_assignments_url(@course), params: {
  #       assignment: {
  #         title: "New Assignment",
  #         description: "Assignment Description",
  #         file: fixture_file_upload(Rails.root.join("test/fixtures/files/sample.pdf"), "application/pdf")
  #       }
  #     }
  #   end
  #   assert_redirected_to course_assignment_url(@course, Assignment.last)
  # end


  # test "should not create assignment as non-admin" do
  #   sign_in @student_user
  #   assert_no_difference("Assignment.count") do
  #     post course_assignments_url(@course), params: {
  #       assignment: {
  #         title: "New Assignment",
  #         description: "Assignment Description",
  #         file: nil
  #       }
  #     }
  #   end
  #   assert_redirected_to root_path
  #   assert_equal "Access denied!", flash[:alert]
  # end

  # test "should not create assignment with invalid parameters" do
  #   sign_in @admin_user
  #   assert_no_difference("Assignment.count") do
  #     post course_assignments_url(@course), params: {
  #       assignment: {
  #         title: "",
  #         description: "",
  #         file: nil
  #       }
  #     }
  #   end
  #   assert_response :unprocessable_entity # Ensure you render errors in this case.
  # end

  # test "should get show assignment with comments and likes" do
  #   sign_in @student_user
  #   get course_assignment_url(@course, @assignment)
  #   assert_response :success
  #   # Add custom matchers for comments and like counts in response if necessary.
  #   assert_includes response.body, "Comments"
  #   assert_includes response.body, "Likes"
  # end
end
