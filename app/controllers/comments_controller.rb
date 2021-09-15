# frozen_string_literal: true

class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    @comment = current_user.comments.new(comment_params)
    flash[:notice] = @comment.errors.full_messages.to_sentence unless @comment.save

    redirect_to track_path(params[:track_id])
  end

  def destroy
    @track = Track.find(params[:track_id])
    @comment = @track.comments.find(params[:id])
    @comment.destroy
    redirect_to track_path(params[:track_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(track_id: params[:track_id])
  end
end
