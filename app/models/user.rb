# frozen_string_literal: true

class User < ApplicationRecord
  before_validation :set_display_name

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, presence: true
  validates :display_name, uniqueness: true

  private

  def set_display_name
    self.display_name = "user-#{SecureRandom.hex(10)}"
  end
end
