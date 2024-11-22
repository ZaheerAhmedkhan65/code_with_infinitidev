require "test_helper"

class CoursesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  # setup do
  #   @admin_user = users(:admin) # Ensure this fixture exists with role: "admin"
  #   @student_user = users(:student) # Ensure this fixture exists with role: "student"
  #   @course = courses(:course_one) # Ensure a course fixture exists
  # end

  # test "should get index as authenticated user" do
  #   sign_in @student_user
  #   get courses_url
  #   assert_response :success
  #   assert_select "h1", "Courses"
  # end

  # test "should redirect index for unauthenticated user" do
  #   get courses_url
  #   assert_redirected_to new_user_session_url
  # end

  # test "should show course for authenticated user" do
  #   sign_in @student_user
  #   get course_url(@course)
  #   assert_response :success
  #   assert_select "h1", @course.title
  # end

  # test "should redirect show for unauthenticated user" do
  #   get course_url(@course)
  #   assert_redirected_to new_user_session_url
  # end

  # test "should get new as admin" do
  #   sign_in @admin_user
  #   get new_course_url
  #   assert_response :success
  # end

  # test "should redirect new for non-admin" do
  #   sign_in @student_user
  #   get new_course_url
  #   assert_redirected_to root_url
  #   assert_equal "You are not allowed to visit this page!", flash[:alert]
  # end

  # test "should redirect new for unauthenticated user" do
  #   get new_course_url
  #   assert_redirected_to new_user_session_url
  # end

  # test "should create course as admin" do
  #   sign_in @admin_user
  #   assert_difference("Course.count") do
  #     post courses_url, params: { course: { title: "New Course", description: "Test", fee: 100 } }
  #   end
  #   assert_redirected_to course_url(Course.last)
  #   assert_equal "Course created successfully.", flash[:notice]
  # end

  # test "should not create course as non-admin" do
  #   sign_in users(:student)
  #   assert_no_difference "Course.count" do
  #     post courses_path, params: { course: { title: "New Course", description: "Test", fee: 100 } }
  #   end
  #   assert_redirected_to root_path
  # end

  # test "should redirect create for unauthenticated user" do
  #   post courses_url, params: { course: { title: "New Course", description: "Test", fee: 100 } }
  #   assert_redirected_to new_user_session_url
  # end

  # test "should get edit as admin" do
  #   sign_in @admin_user
  #   get edit_course_url(@course)
  #   assert_response :success
  # end

  # test "should redirect edit for non-admin" do
  #   sign_in @student_user
  #   get edit_course_url(@course)
  #   assert_redirected_to root_url
  # end

  # test "should redirect edit for unauthenticated user" do
  #   get edit_course_url(@course)
  #   assert_redirected_to new_user_session_url
  # end

  # test "should update course as admin" do
  #   sign_in @admin_user
  #   patch course_url(@course), params: { course: { title: "Updated Title" } }
  #   assert_redirected_to course_url(@course)
  #   assert_equal "Course updated successfully.", flash[:notice]
  #   @course.reload
  #   assert_equal "Updated Title", @course.title
  # end

  # test "should not update course as non-admin" do
  #   sign_in users(:student)
  #   patch course_path(courses(:course_one)), params: { course: { title: "Updated Title" } }
  #   assert_redirected_to root_path
  # end

  # test "should redirect update for unauthenticated user" do
  #   patch course_url(@course), params: { course: { title: "Updated Title" } }
  #   assert_redirected_to new_user_session_url
  # end

  # test "should destroy course as admin" do
  #   sign_in @admin_user
  #   assert_difference("Course.count", -1) do
  #     delete course_url(@course)
  #   end
  #   assert_redirected_to courses_url
  #   assert_equal "Course deleted successfully.", flash[:notice]
  # end

  # test "should not destroy course as non-admin" do
  #   sign_in @student_user
  #   assert_no_difference("Course.count") do
  #     delete course_url(@course)
  #   end
  #   assert_redirected_to root_url
  # end

  # test "should redirect destroy for unauthenticated user" do
  #   delete course_url(@course)
  #   assert_redirected_to new_user_session_url
  # end

  # test "should join course as authenticated user" do
  #   sign_in @student_user
  #   post join_course_url(@course)
  #   assert_redirected_to user_url(@student_user)
  #   assert_equal "You have successfully joined the course.", flash[:notice]
  #   @course.reload
  #   assert_equal @student_user, @course.user
  # end

  # test "should not join course for unauthenticated user" do
  #   post join_course_url(@course)
  #   assert_redirected_to new_user_session_url
  # end
end
