# frozen_string_literal: true

class CreateTracks < ActiveRecord::Migration[6.1]
  def change
    create_table :tracks do |t|
      t.string :title, null: false
      t.string :genre, null: false
      t.text :description

      t.timestamps
    end
  end
end
