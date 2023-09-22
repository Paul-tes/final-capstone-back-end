class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :room_number
      t.integer :capacity
      t.string :location
      t.string :floor
      t.string :img
      t.decimal :price_per_day
      t.text :description
      t.text :comment
      t.boolean :available
      t.integer :rating
      t.string :hosted_by
      t.integer :likes

      t.timestamps
    end
  end
end
