# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :track
  belongs_to :user
end
