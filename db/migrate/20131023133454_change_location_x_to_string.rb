class ChangeLocationXToString < ActiveRecord::Migration
  def up
    change_column :parking_spaces, :location_x, :string, null: false
  end

  def down
  end
end
