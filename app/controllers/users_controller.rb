class UsersController < ApplicationController
  before_action :authenticate_user!, except: [ :show ]
  before_action :set_user, only: [ :change_role, :destroy ]


  def index
    @students = User.students # only users with the role of "student"
  end

  def show
    @user = User.find(params[:id])
    @assignments = @user.assignments
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "User was successfully deleted."
  end

  def change_role
    new_role = params[:user][:role]
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

  def user_params
    if current_user.admin?
      params.require(:user).permit(:username, :email, :role, :password, :password_confirmation, :avatar)
    else
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :avatar)
    end
  end
end
