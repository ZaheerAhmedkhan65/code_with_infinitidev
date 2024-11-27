class StaticPagesController < ApplicationController
  def home
    @courses = Course.all
    @course = Course.find_by(id: params[:course_id]) # Use course_id from params, or hardcode an ID
    if @course
      @code_snippets = @course.code_snippets
    else
      @code_snippets = [] # Handle the case where no course is found
    end
  end

  def about
  end

  def faq
  end

  def help
  end
end
