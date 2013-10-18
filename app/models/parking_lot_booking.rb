class ParkingLotBooking < ActiveRecord::Base
  belongs_to :user
  belongs_to :parking_space_lot
  attr_accessible :booking_type_id, :end_date, :end_time, :number_of_lots_booked, :payment_amount, :payment_reference, :start_date, :start_time
end
