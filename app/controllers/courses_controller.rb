class CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course, only: [ :show, :edit, :update, :destroy ]
  before_action :authorize_admin!, only: [ :new, :create, :edit,  :update, :destroy ]

  def index
    @courses = Course.all
  end

  def show
    @lessons = @course.lessons
    @assignments = @course.assignments
  end

  def new
    @course = current_user.courses.build
  end

  def create
    @course = current_user.courses.build(course_params)
    if @course.save
      redirect_to @course, notice: "Course created successfully."
    else
      render :new
    end
  end

  def edit
    render :new
  end

  def update
    if @course.update(course_params)
      redirect_to @course, notice: "Course updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    redirect_to courses_path, notice: "Course deleted successfully."
  end

  def join
    course = Course.find(params[:id])
    if course.update(user: current_user)
      redirect_to user_path(current_user), notice: "You have successfully joined the course."
    else
      redirect_back fallback_location: courses_path, alert: "Failed to join the course."
    end
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :description, :fee)
  end

  def authorize_admin!
    redirect_to root_path, alert: "You are not allowed to visit this page!" unless current_user&.admin?
  end
end
