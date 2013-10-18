class ParkingSpaceLotPrice < ActiveRecord::Base
  belongs_to :parking_space_lot
  attr_accessible :price_per_day, :price_per_fortnight, :price_per_hour, :price_per_month
end
