# frozen_string_literal: true

class AddLocationAndProfileUrlToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :location, :string
    add_column :users, :profile_url, :string, null: false
  end
end
