# frozen_string_literal: true

module ProfileHelper
  def find_likes_per_user(user_id)
    user_tracks = Track.where(user_id: user_id)
    user_likes = 0
    user_tracks.each do |track|
      user_likes += track.likes.count
    end
    user_likes
  end
end
