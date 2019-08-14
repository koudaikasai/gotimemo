class AddDetailsToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :first_name, :string
    add_column :admins, :last_name, :string
    add_column :admins, :first_name_kana, :string
    add_column :admins, :last_name_kana, :string
    add_column :admins, :nickname, :string
  end
end
