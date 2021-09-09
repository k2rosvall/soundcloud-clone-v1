# frozen_string_literal: true

class AddUserIdToTracks < ActiveRecord::Migration[6.1]
  def change
    add_column :tracks, :user_id, :integer
    add_index :tracks, :user_id
  end
end
