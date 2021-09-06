# frozen_string_literal: true

class AddLocationAndProfileIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :profile_id, :string, null: false
  end
end
