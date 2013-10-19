class ChangeLocationXColumnToFloat < ActiveRecord::Migration
  def up
    change_column :parking_spaces, :location_x, :float, :precision => 15, :scale => 2, null: false
  end

  def down
  end
end
