class LessonsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_course
    before_action :set_lesson, only: [ :show ]
    before_action :check_admin, only: [ :new ]

    def show
      @comments = @lesson.comments
      @comment = Comment.new
    end

    def new
        @lesson = @course.lessons.new
    end

    def create
      @lesson = @course.lessons.new(lesson_params)
      if @lesson.save
        redirect_to course_lesson_path(@course, @lesson), notice: "Lesson created successfully."
      else
        render :new
      end
    end

    private

    def check_admin
      if user_signed_in? && current_user.role != "admin"
       redirect_to root_path, alert: "You are not allowed to visit this page!"
      end
    end

    def set_course
      @course = Course.find(params[:course_id])
    end

    def set_lesson
      @lesson = @course.lessons.find(params[:id])
    end

    def lesson_params
        params.require(:lesson).permit(:title, :content, :lesson_date)
    end
end
