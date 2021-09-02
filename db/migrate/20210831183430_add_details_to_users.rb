# frozen_string_literal: true

class AddDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :display_name, :string
    add_column :users, :bio, :text
    add_column :users, :followers_count, :int, default: 0
    add_column :users, :following_count, :int, default: 0
    add_column :users, :tracks_count, :int, default: 0
  end
end
