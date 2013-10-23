class ChangeLocationYToString < ActiveRecord::Migration
  def up
    change_column :parking_spaces, :location_y, :string, null: false
  end

  def down
  end
end
