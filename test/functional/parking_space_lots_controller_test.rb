require 'test_helper'

class ParkingSpaceLotsControllerTest < ActionController::TestCase
  setup do
    @parking_space_lot = parking_space_lots(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:parking_space_lots)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create parking_space_lot" do
    assert_difference('ParkingSpaceLot.count') do
      post :create, parking_space_lot: { allowed_vehicle_type_id: @parking_space_lot.allowed_vehicle_type_id, end_date: @parking_space_lot.end_date, end_time: @parking_space_lot.end_time, number_of_lots: @parking_space_lot.number_of_lots, preferred_duration_type_id: @parking_space_lot.preferred_duration_type_id, start_date: @parking_space_lot.start_date, start_time: @parking_space_lot.start_time }
    end

    assert_redirected_to parking_space_lot_path(assigns(:parking_space_lot))
  end

  test "should show parking_space_lot" do
    get :show, id: @parking_space_lot
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @parking_space_lot
    assert_response :success
  end

  test "should update parking_space_lot" do
    put :update, id: @parking_space_lot, parking_space_lot: { allowed_vehicle_type_id: @parking_space_lot.allowed_vehicle_type_id, end_date: @parking_space_lot.end_date, end_time: @parking_space_lot.end_time, number_of_lots: @parking_space_lot.number_of_lots, preferred_duration_type_id: @parking_space_lot.preferred_duration_type_id, start_date: @parking_space_lot.start_date, start_time: @parking_space_lot.start_time }
    assert_redirected_to parking_space_lot_path(assigns(:parking_space_lot))
  end

  test "should destroy parking_space_lot" do
    assert_difference('ParkingSpaceLot.count', -1) do
      delete :destroy, id: @parking_space_lot
    end

    assert_redirected_to parking_space_lots_path
  end
end
