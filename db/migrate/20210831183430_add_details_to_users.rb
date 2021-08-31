class AddDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :display_name, :string
    add_column :users, :bio, :text
    add_column :users, :followers, :int
    add_column :users, :following, :int
    add_column :users, :tracks, :int
  end
end
