class HelpRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_help_request, only: %i[show edit update destroy]
  before_action :authorize_user!, only: %i[show edit update destroy]

  # GET /help_requests
  def index
    @help_requests = current_user.admin? ? HelpRequest.all : current_user.help_requests
  end

  # GET /help_requests/new
  def new
    @help_request = HelpRequest.new
  end

  # POST /help_requests
  def create
    @help_request = current_user.help_requests.build(help_request_params)
    if @help_request.save
      redirect_to help_requests_path(@help_request), notice: "Help request submitted successfully."
    else
      render :new
    end
  end

  def destroy
    @help_request.destroy!

    respond_to do |format|
      format.html { redirect_to help_requests_path, status: :see_other, notice: "Help request was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def edit
  end

  def update
    if current_user.admin? && @help_request.update(help_request_params)
      redirect_to help_requests_path, notice: "Reply sent successfully."
    elsif @help_request.update(help_request_params)
      redirect_to help_requests_path, notice: "Help request updated successfully."
    else
      render :edit
    end
  end


  private

  def set_help_request
    @help_request = HelpRequest.find(params[:id])
  end

  def help_request_params
    params.require(:help_request).permit(:title, :message, :reply)
  end

  def authorize_user!
    unless current_user.admin? || @help_request.user == current_user
      redirect_to help_requests_path, alert: "You are not authorized to view this help request."
    end
  end
end
