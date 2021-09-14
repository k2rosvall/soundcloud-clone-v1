# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @latest_tracks = latest_tracks_per_user
    @pop_tracks = pop_tracks
    @rock_tracks = rock_tracks
    @edm_tracks = dance_and_edm_tracks
    @rap_tracks = hip_hop_and_rap_tracks
  end

  private

  def latest_tracks_per_user
    User.includes(:tracks).all.map { |u| u.tracks.last }
  end

  def pop_tracks
    Track.where(genre: 'Pop')
  end

  def rock_tracks
    Track.where(genre: 'Rock')
  end

  def dance_and_edm_tracks
    Track.where(genre: 'Dance & EDM')
  end

  def hip_hop_and_rap_tracks
    Track.where(genre: 'Hip-Hop & Rap')
  end
end
