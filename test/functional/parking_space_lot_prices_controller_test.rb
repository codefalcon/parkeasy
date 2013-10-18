require 'test_helper'

class ParkingSpaceLotPricesControllerTest < ActionController::TestCase
  setup do
    @parking_space_lot_price = parking_space_lot_prices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:parking_space_lot_prices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create parking_space_lot_price" do
    assert_difference('ParkingSpaceLotPrice.count') do
      post :create, parking_space_lot_price: { price_per_day: @parking_space_lot_price.price_per_day, price_per_fortnight: @parking_space_lot_price.price_per_fortnight, price_per_hour: @parking_space_lot_price.price_per_hour, price_per_month: @parking_space_lot_price.price_per_month }
    end

    assert_redirected_to parking_space_lot_price_path(assigns(:parking_space_lot_price))
  end

  test "should show parking_space_lot_price" do
    get :show, id: @parking_space_lot_price
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @parking_space_lot_price
    assert_response :success
  end

  test "should update parking_space_lot_price" do
    put :update, id: @parking_space_lot_price, parking_space_lot_price: { price_per_day: @parking_space_lot_price.price_per_day, price_per_fortnight: @parking_space_lot_price.price_per_fortnight, price_per_hour: @parking_space_lot_price.price_per_hour, price_per_month: @parking_space_lot_price.price_per_month }
    assert_redirected_to parking_space_lot_price_path(assigns(:parking_space_lot_price))
  end

  test "should destroy parking_space_lot_price" do
    assert_difference('ParkingSpaceLotPrice.count', -1) do
      delete :destroy, id: @parking_space_lot_price
    end

    assert_redirected_to parking_space_lot_prices_path
  end
end
