class ParkingSpace < ActiveRecord::Base
  belongs_to :user
  attr_accessible :location_address, :location_x, :location_y
end
