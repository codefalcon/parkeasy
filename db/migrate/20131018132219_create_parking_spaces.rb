class CreateParkingSpaces < ActiveRecord::Migration
  def change
    create_table :parking_spaces do |t|
      t.text :location_address
      t.decimal :location_x
      t.decimal :location_y
      t.references :user

      t.timestamps
    end
    add_index :parking_spaces, :user_id
  end
end
