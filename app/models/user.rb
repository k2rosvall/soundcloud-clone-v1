# frozen_string_literal: true

class User < ApplicationRecord
  before_validation :set_profile_url, on: :create

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, presence: true
  validates :profile_url, uniqueness: true, presence: true
  validates :bio, length: { maximum: 255 }

  has_one_attached :avatar

  private

  def set_profile_url
    self.profile_url = "user-#{SecureRandom.hex(10)}"
  end
end
