class ParkingSpaceLot < ActiveRecord::Base
  belongs_to :parking_space
  attr_accessible :allowed_vehicle_type_id, :end_date, :end_time, :number_of_lots, :preferred_duration_type_id, :start_date, :start_time
end
