require 'test_helper'

class ParkingLotBookingsControllerTest < ActionController::TestCase
  setup do
    @parking_lot_booking = parking_lot_bookings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:parking_lot_bookings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create parking_lot_booking" do
    assert_difference('ParkingLotBooking.count') do
      post :create, parking_lot_booking: { booking_type_id: @parking_lot_booking.booking_type_id, end_date: @parking_lot_booking.end_date, end_time: @parking_lot_booking.end_time, number_of_lots_booked: @parking_lot_booking.number_of_lots_booked, payment_amount: @parking_lot_booking.payment_amount, payment_reference: @parking_lot_booking.payment_reference, start_date: @parking_lot_booking.start_date, start_time: @parking_lot_booking.start_time }
    end

    assert_redirected_to parking_lot_booking_path(assigns(:parking_lot_booking))
  end

  test "should show parking_lot_booking" do
    get :show, id: @parking_lot_booking
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @parking_lot_booking
    assert_response :success
  end

  test "should update parking_lot_booking" do
    put :update, id: @parking_lot_booking, parking_lot_booking: { booking_type_id: @parking_lot_booking.booking_type_id, end_date: @parking_lot_booking.end_date, end_time: @parking_lot_booking.end_time, number_of_lots_booked: @parking_lot_booking.number_of_lots_booked, payment_amount: @parking_lot_booking.payment_amount, payment_reference: @parking_lot_booking.payment_reference, start_date: @parking_lot_booking.start_date, start_time: @parking_lot_booking.start_time }
    assert_redirected_to parking_lot_booking_path(assigns(:parking_lot_booking))
  end

  test "should destroy parking_lot_booking" do
    assert_difference('ParkingLotBooking.count', -1) do
      delete :destroy, id: @parking_lot_booking
    end

    assert_redirected_to parking_lot_bookings_path
  end
end
