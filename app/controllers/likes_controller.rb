class LikesController < ApplicationController
  before_action :find_track
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @track.likes.create(user_id: current_user.id)
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    if already_liked?
      @like.destroy
    else
      flash[:notice] = 'Cannot unlike'
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def find_track
    @track = Track.find(params[:track_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, track_id: params[:track_id]).exists?
  end

  def find_like
    @like = @track.likes.find(params[:id])
  end
end
