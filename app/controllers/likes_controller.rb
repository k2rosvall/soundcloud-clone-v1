# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :find_track
  before_action :find_like, only: [:destroy]

  def create
    @track.likes.create(user_id: current_user.id)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def find_track
    @track = Track.find(params[:track_id])
  end

  def find_like
    @like = @track.likes.find(params[:id])
  end
end
