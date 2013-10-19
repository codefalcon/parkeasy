class ParkingLotBookingsController < ApplicationController
  # GET /parking_lot_bookings
  # GET /parking_lot_bookings.json
  def search
    @parking_lot_booking = ParkingLotBooking.new
    @allowed_vehicle_types = AllowedVehicleType.AllowedVehicleTypes().to_a
  end

  def index
    @parking_lot_bookings = ParkingLotBooking.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @parking_lot_bookings }
    end
  end

  # GET /parking_lot_bookings/1
  # GET /parking_lot_bookings/1.json
  def show
    @parking_lot_booking = ParkingLotBooking.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @parking_lot_booking }
    end
  end

  # GET /parking_lot_bookings/new
  # GET /parking_lot_bookings/new.json
  def new
    @parking_lot_booking = ParkingLotBooking.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @parking_lot_booking }
    end
  end

  def search
    @parking_lot_booking = ParkingLotBooking.new
  end
  def booking
    @parking_lot_booking = ParkingLotBooking.new
  end
  # GET /parking_lot_bookings/1/edit
  def edit
    @parking_lot_booking = ParkingLotBooking.find(params[:id])
  end

  # POST /parking_lot_bookings
  # POST /parking_lot_bookings.json
  def create
    @parking_lot_booking = ParkingLotBooking.new(params[:parking_lot_booking])
    @parking_lot_booking.user = current_user
    respond_to do |format|
      if @parking_lot_booking.save
        format.html { redirect_to @parking_lot_booking, notice: 'Parking lot booking was successfully created.' }
        format.json { render json: @parking_lot_booking, status: :created, location: @parking_lot_booking }
      else
        format.html { render action: "new" }
        format.json { render json: @parking_lot_booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /parking_lot_bookings/1
  # PUT /parking_lot_bookings/1.json
  def update
    @parking_lot_booking = ParkingLotBooking.find(params[:id])

    respond_to do |format|
      if @parking_lot_booking.update_attributes(params[:parking_lot_booking])
        format.html { redirect_to @parking_lot_booking, notice: 'Parking lot booking was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @parking_lot_booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parking_lot_bookings/1
  # DELETE /parking_lot_bookings/1.json
  def destroy
    @parking_lot_booking = ParkingLotBooking.find(params[:id])
    @parking_lot_booking.destroy

    respond_to do |format|
      format.html { redirect_to parking_lot_bookings_url }
      format.json { head :no_content }
    end
  end
end
