class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!

  def dashboard
    @users = User.all
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
