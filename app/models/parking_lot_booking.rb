class ParkingLotBooking < ActiveRecord::Base
  belongs_to :user
  belongs_to :parking_space_lot
  validates_presence_of :end_date, :start_date, :start_time, :end_date
  attr_accessible :booking_type_id, :end_date, :end_time, :number_of_lots_booked, :payment_amount, :payment_reference, :start_date, :start_time
  def BookingType
    booking_type_id = BookingType.BookingTypes().select { |key, value| value == self.booking_type_id }
    
    if booking_type_id.nil? 
      return nil 
    else 
      return booking_type_id[0][0] 
    end
  end
end
