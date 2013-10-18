class AddContactNumberToParkingSpaces < ActiveRecord::Migration
  def change
    add_column :parking_spaces, :contact_number, :string
  end
end
