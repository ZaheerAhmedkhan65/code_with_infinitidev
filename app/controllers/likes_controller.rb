class LikesController < ApplicationController
  before_action :find_likeable

  def create
    @like = @likeable.likes.find_or_initialize_by(user: current_user)

    if @like.persisted? && @like.like_type == params[:like_type].to_i
      # User clicked the same type of like, remove it (dislike or undo)
      @like.destroy
      flash[:notice] = "You removed your #{like_type_text(params[:like_type])}."
    else
      # Save or update the like with the new type
      @like.update(like_type: params[:like_type])
      flash[:notice] = "You #{like_type_text(params[:like_type])} this successfully!"
    end

    redirect_back fallback_location: root_path
  end

  private

  def find_likeable
    klass = params[:likeable_type].constantize
    @likeable = klass.find(params[:assignment_id] || params[:likeable_id])
  end

  def like_type_text(like_type)
    like_type == "1" ? "liked" : "disliked"
  end
end
