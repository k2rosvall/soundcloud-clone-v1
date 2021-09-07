class Track < ApplicationRecord
  belongs_to :user
  has_one_attached :track_file
  has_one_attached :cover_image

  validates :track_file, presence: true
end
