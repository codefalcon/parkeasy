class ChangeLocationYColumnToFloat < ActiveRecord::Migration
  def up
    change_column :parking_spaces, :location_y, :float, :precision => 15, :scale => 2, null: false
  end

  def down
  end
end
