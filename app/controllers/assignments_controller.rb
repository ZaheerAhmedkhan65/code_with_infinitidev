class AssignmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course
  before_action :set_assignment, only: [ :show ]
  before_action :authorize_admin!, only: [ :new, :create ]

  def index
    @assignments = @course.assignments
  end

  def show
    @comments = @assignment.comments
    @comment = Comment.new
    @like_count = @assignment.likes.where(like_type: 1).count
    @dislike_count = @assignment.likes.where(like_type: 2).count
  end

  def new
    @assignment = @course.assignments.build
  end

  def create
    @assignment = @course.assignments.build(assignment_params)
    @assignment.user = current_user

    if @assignment.save
      redirect_to course_assignment_path(@course, @assignment), notice: "Assignment created successfully."
    else
      Rails.logger.debug(@assignment.errors.full_messages.join(", "))
      render :new, status: :unprocessable_entity
    end
  end

 private

  def authorize_admin!
    unless current_user&.admin?
      redirect_to root_path, alert: "Access denied!"
    end
  end

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_assignment
    @assignment = @course.assignments.find(params[:id])
  end

  def assignment_params
    params.require(:assignment).permit(:title, :description, :due_date, :file)
  end
end
