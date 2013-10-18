class CreateParkingSpaceLotPrices < ActiveRecord::Migration
  def change
    create_table :parking_space_lot_prices do |t|
      t.decimal :price_per_hour
      t.decimal :price_per_day
      t.decimal :price_per_fortnight
      t.decimal :price_per_month
      t.references :parking_space_lot

      t.timestamps
    end
    add_index :parking_space_lot_prices, :parking_space_lot_id
  end
end
