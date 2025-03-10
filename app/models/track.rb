# frozen_string_literal: true

class Track < ApplicationRecord
  belongs_to :user, counter_cache: true
  has_one_attached :track_file
  has_one_attached :cover_image

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :track_file, :cover_image, :title, :genre, presence: true
  validates :track_file, content_type: ['audio/mpeg', 'audio/x-mp3', 'audio/x-flac', 'audio/x-wav', 'audio/x-alac', 'audio/x-aiff', 'audio/vnd.wave']
  validates :cover_image, content_type: ['image/png', 'image/jpg', 'image/jpeg']
end
