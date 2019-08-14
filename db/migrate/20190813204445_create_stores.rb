class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.text :store_name
      t.text :item_image_id
      t.integer :user_id
      t.integer :favorite_id
      t.integer :genre
      t.integer :waittime
      t.integer :release
      t.integer :area
      t.string :station
      t.integer :people_number
      t.text :store_address
      t.text :impression

      t.timestamps
    end
  end
end
