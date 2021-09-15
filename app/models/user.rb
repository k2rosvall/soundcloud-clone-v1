# frozen_string_literal: true

class User < ApplicationRecord
  before_validation :set_profile_id, on: :create

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :tracks, dependent: :destroy
  has_many :followed_users, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :follower_users, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
  has_many :following, through: :followed_users, source: :followed
  has_many :followers, through: :follower_users, source: :follower
  has_many :likes, dependent: :destroy
  has_many :comments

  validates :first_name, :last_name, presence: true
  validates :profile_id, uniqueness: true, presence: true
  validates :bio, length: { maximum: 255 }
  validates :avatar, content_type: ['image/png', 'image/jpg', 'image/jpeg']

  def follow(other_user)
    followed_users.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    followed_users.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end

  private

  def set_profile_id
    self.profile_id = "user-#{SecureRandom.hex(10)}"
  end
end
