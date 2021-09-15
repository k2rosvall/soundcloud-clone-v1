# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :track
  belongs_to :user
end
