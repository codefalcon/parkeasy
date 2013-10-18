class AddPlaceToParkingSpaces < ActiveRecord::Migration
  def change
    add_column :parking_spaces, :place, :string
  end
end
