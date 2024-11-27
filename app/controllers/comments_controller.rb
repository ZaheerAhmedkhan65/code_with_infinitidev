class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_commentable, except: [ :destroy ]
  before_action :set_comment, only: [ :edit, :update, :destroy ]

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_back fallback_location: root_path, notice: "Comment added successfully."
    else
      redirect_back fallback_location: root_path, alert: "Failed to add comment."
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      # Redirect to the appropriate path based on the type of commentable
      if @commentable.is_a?(Lesson)
        redirect_to course_lesson_path(@commentable.course, @commentable), notice: "Comment updated successfully."
      elsif @commentable.is_a?(Assignment)
        redirect_to course_assignment_path(@commentable.course, @commentable), notice: "Comment updated successfully."
      else
        redirect_to root_path, alert: "Unknown commentable type."
      end
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_back fallback_location: root_path, notice: "Comment deleted successfully."
  end

  private

  def set_commentable
    if params[:lesson_id]
      @commentable = Lesson.find(params[:lesson_id])
    elsif params[:assignment_id]
      @commentable = Assignment.find(params[:assignment_id])
    else
      redirect_to root_path, alert: "Invalid commentable type."
    end
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
