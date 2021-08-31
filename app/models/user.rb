# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, presence: true

  before_create :set_default_values

  private

  def set_default_values
    self.display_name = "user-#{SecureRandom.hex(10)}"
    self.bio = ''
    self.followers = 0
    self.following = 0
    self.tracks = 0
  end
end
