# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @latest_tracks = latest_tracks_per_user
  end

  private

  def latest_tracks_per_user
    User.includes(:tracks).first(50).map { |u| u.tracks.last }.compact
  end

  def tracks_per_genre(genre)
    Track.where(genre: genre).first(50)
  end

  helper_method :tracks_per_genre
end
