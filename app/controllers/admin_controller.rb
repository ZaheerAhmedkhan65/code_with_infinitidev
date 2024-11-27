class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!

  def dashboard
    @users = User.all
    @courses = Course.all
    @lessons = Lesson.all
    @code_snippet = CodeSnippet.first
  end

  def index
    @users = User.all
  end

  private

  def authorize_admin!
    unless current_user&.admin?
      redirect_to root_path, alert: "Access denied!"
    end
  end
end
