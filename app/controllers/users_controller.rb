class UsersController < ApplicationController
  before_action :authenticate_user!, except: [ :show ]
  before_action :set_user, only: [ :show, :destroy, :change_role ]
  before_action :authorize_admin!, only: [ :change_role ]

  def index
    @students = User.students
    @code_snippet = CodeSnippet.first
  end


  def show
    @assignments = @user.assignments
    @code_snippet = CodeSnippet.first
  end


  def destroy
    if @user.destroy
      redirect_to users_path, notice: "User was successfully deleted."
    else
      redirect_to users_path, alert: "Failed to delete user."
    end
  end


  def change_role
    new_role = params.require(:user).permit(:role)[:role]
    if @user.update(role: new_role)
      redirect_to users_path, notice: "User role updated successfully."
    else
      redirect_to users_path, alert: "Failed to update user role."
    end
  end


  private

  def set_user
    @user = User.find(params[:id])
  end


  def authorize_admin!
    redirect_to root_path, alert: "You are not authorized to perform this action." unless current_user&.admin?
  end


  def user_params
    permitted_params = [ :username, :email, :password, :password_confirmation, :avatar ]
    permitted_params << :role if current_user&.admin?
    params.require(:user).permit(permitted_params)
  end
end
