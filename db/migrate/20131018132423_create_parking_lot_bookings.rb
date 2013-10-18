class CreateParkingLotBookings < ActiveRecord::Migration
  def change
    create_table :parking_lot_bookings do |t|
      t.integer :number_of_lots_booked
      t.integer :booking_type_id
      t.date :start_date
      t.date :end_date
      t.time :start_time
      t.time :end_time
      t.decimal :payment_amount
      t.string :payment_reference
      t.references :user
      t.references :parking_space_lot

      t.timestamps
    end
    add_index :parking_lot_bookings, :user_id
    add_index :parking_lot_bookings, :parking_space_lot_id
  end
end
