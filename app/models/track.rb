# frozen_string_literal: true

class Track < ApplicationRecord
  belongs_to :user, counter_cache: true
  has_one_attached :track_file
  has_one_attached :cover_image

  validates :track_file, presence: true
end
