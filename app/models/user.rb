# frozen_string_literal: true

class User < ApplicationRecord
  before_validation :set_profile_id, on: :create

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :tracks

  validates :first_name, :last_name, presence: true
  validates :profile_id, uniqueness: true, presence: true
  validates :bio, length: { maximum: 255 }
  validates :avatar, content_type: ['image/png', 'image/jpg', 'image/jpeg']

  private

  def set_profile_id
    self.profile_id = "user-#{SecureRandom.hex(10)}"
  end
end
