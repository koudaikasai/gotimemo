class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :user_image_id, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :first_name_kana, :string
    add_column :users, :last_name_kana, :string
    add_column :users, :nickname, :string
    add_column :users, :like_genre, :integer
  end
end
