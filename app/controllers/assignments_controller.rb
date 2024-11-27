class AssignmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course
  before_action :set_assignment, only: [ :show, :edit, :update, :destroy ]
  before_action :authorize_admin!, only: [ :index, :new, :create ]

  def index
    @assignments =  Assignment.all
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

  def edit
  end

  def update
    if @assignment.update(assignment_params)
      redirect_to course_assignment_path(@course, @assignment), notice: "Assignment updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @assignment.destroy
    redirect_to course_assignments_path(@course), notice: "Assignment deleted successfully."
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
    params.require(:assignment).permit(:title, :description, :due_date, :file, :image)
  end
end
