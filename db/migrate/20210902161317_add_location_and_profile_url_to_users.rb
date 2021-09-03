# frozen_string_literal: true

class AddLocationAndProfileUrlToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :profile_url, :string, null: false
  end
end
