require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  # setup do
  #   @user = users(:student)
  #   @course = courses(:course_one)
  #   @lesson = lessons(:lesson_one)
  #   @assignment = assignments(:assignment_one)
  #   @comment = comments(:comment_one)  # This is pre-existing comment for the lesson or assignment

  #   sign_in @user
  # end

  # # Lesson Comments Tests
  # test "should create comment for lesson" do
  #   assert_difference("Comment.count", 1) do
  #     post course_lesson_comments_url(course_id: @course.id, lesson_id: @lesson.id),
  #          params: { comment: { content: "This is a comment for a lesson." } }
  #   end
  #   assert_redirected_to course_lesson_path(@course, @lesson)
  #   follow_redirect!
  #   assert_match "This is a comment for a lesson.", response.body
  # end

  # test "should not create comment with invalid data for lesson" do
  #   assert_no_difference("Comment.count") do
  #     post course_lesson_comments_url(course_id: @course.id, lesson_id: @lesson.id),
  #          params: { comment: { content: "" } }
  #   end
  #   assert_redirected_to course_lesson_path(@course, @lesson)
  #   follow_redirect!
  #   assert_match "Failed to add comment.", flash[:alert]
  # end

  # test "should edit comment for lesson" do
  #   get edit_course_lesson_comment_url(course_id: @course.id, lesson_id: @lesson.id, id: @comment.id)
  #   assert_response :success
  # end

  # test "should update comment for lesson" do
  #   patch course_lesson_comment_url(course_id: @course.id, lesson_id: @lesson.id, id: @comment.id),
  #         params: { comment: { content: "Updated lesson comment" } }
  #   assert_redirected_to course_lesson_path(@course, @lesson)
  #   @comment.reload
  #   assert_equal "Updated lesson comment", @comment.content
  # end

  # test "should not update comment with invalid data for lesson" do
  #   patch course_lesson_comment_url(course_id: @course.id, lesson_id: @lesson.id, id: @comment.id),
  #         params: { comment: { content: "" } }
  #   assert_template :edit
  #   assert_select 'div.alert', "Content can't be blank"  # This checks that the error message is rendered
  # end

  # test "should destroy comment for lesson" do
  #   assert_difference("Comment.count", -1) do
  #     delete course_lesson_comment_url(course_id: @course.id, lesson_id: @lesson.id, id: @comment.id)
  #   end
  #   assert_redirected_to course_lesson_path(@course, @lesson)
  #   assert_not Comment.exists?(@comment.id)
  # end

  # # Assignment Comments Tests
  # test "should create comment for assignment" do
  #   assert_difference("Comment.count", 1) do
  #     post course_assignment_comments_url(course_id: @course.id, assignment_id: @assignment.id),
  #          params: { comment: { content: "This is a comment for an assignment." } }
  #   end
  #   assert_redirected_to course_assignment_path(@course, @assignment)
  #   follow_redirect!
  #   assert_match "This is a comment for an assignment.", response.body
  # end

  # test "should not create comment with invalid data for assignment" do
  #   assert_no_difference("Comment.count") do
  #     post course_assignment_comments_url(course_id: @course.id, assignment_id: @assignment.id),
  #          params: { comment: { content: "" } }
  #   end
  #   assert_redirected_to course_assignment_path(@course, @assignment)
  #   follow_redirect!
  #   assert_match "Failed to add comment.", flash[:alert]
  # end

  # test "should edit comment for assignment" do
  #   get edit_course_assignment_comment_url(course_id: @course.id, assignment_id: @assignment.id, id: @comment.id)
  #   assert_response :success
  # end

  # test "should update comment for assignment" do
  #   patch course_assignment_comment_url(course_id: @course.id, assignment_id: @assignment.id, id: @comment.id),
  #         params: { comment: { content: "Updated assignment comment" } }
  #   assert_redirected_to course_assignment_path(@course, @assignment)
  #   @comment.reload
  #   assert_equal "Updated assignment comment", @comment.content
  # end

  # test "should not update comment with invalid data for assignment" do
  #   patch course_assignment_comment_url(course_id: @course.id, assignment_id: @assignment.id, id: @comment.id),
  #         params: { comment: { content: "" } }
  #   assert_template :edit
  #   assert_select 'div.alert', "Content can't be blank"  # Ensure the error is displayed
  # end

  # test "should destroy comment for assignment" do
  #   assert_difference("Comment.count", -1) do
  #     delete course_assignment_comment_url(course_id: @course.id, assignment_id: @assignment.id, id: @comment.id)
  #   end
  #   assert_redirected_to course_assignment_path(@course, @assignment)
  #   assert_not Comment.exists?(@comment.id)
  # end
end
