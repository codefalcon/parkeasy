class CreateParkingSpaceLots < ActiveRecord::Migration
  def change
    create_table :parking_space_lots do |t|
      t.date :start_date
      t.date :end_date
      t.time :start_time
      t.time :end_time
      t.integer :allowed_vehicle_type_id
      t.integer :number_of_lots
      t.integer :preferred_duration_type_id
      t.references :parking_space

      t.timestamps
    end
    add_index :parking_space_lots, :parking_space_id
  end
end
