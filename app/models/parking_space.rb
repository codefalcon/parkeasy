class ParkingSpace < ActiveRecord::Base
  belongs_to :user
  has_many :parking_space_lot
  attr_accessible :location_address, :location_x, :location_y, :place, :contact_number, :user_id, :created_at, :updated_at
  validates_presence_of :location_x, :location_y
end
