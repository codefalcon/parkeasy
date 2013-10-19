class ParkingLotBookingsController < ApplicationController
  # GET /parking_lot_bookings
  # GET /parking_lot_bookings.json
  include ApplicationHelper
  require 'date'
   def find_empty_lots
    @lat = params[:parking_space][:location_x].to_f
    @long = params[:parking_space][:location_y].to_f
    @parking_spaces = ParkingSpace.where("location_x between ? AND ? AND location_y between ? AND ?",@lat-2,@lat+2,@long-2,@long+2);
    #@parking_spaces = ParkingSpace.where("location_x = ? AND location_y = ?",13,14);
    @allwd_vehicle = 1 #params[:allowed_vechicle_type_id]
    @start_date = get_date_from_str(params[:parking_lot_booking][:start_date])
    @end_date = get_end_date(params[:parking_lot_booking][:end_date],@start_date) 
    @parking_space_lots =[]
    @available_lots ={}
    @resultant_lots_hash = []
    @parking_spaces.each do |place|
      #@parking_space_lot = ParkingSpaceLot.where("number_of_lots > 0 AND parking_space_id = ? AND allowed_vehicle_type_id = ? AND end_date > ? AND start_date < ?",place.id,@allwd_vehicle,@end_date,@start_date).first()
      @parking_space_lot = ParkingSpaceLot.where("number_of_lots > 0 AND parking_space_id = ? AND allowed_vehicle_type_id = 1",place.id).first()
      if !@parking_space_lot.nil?
         @parking_space_lots.append(@parking_space_lot)
         @available_lots[@parking_space_lot.id] = @parking_space_lot.number_of_lots
      end      
   end
   @parking_space_lots.each do |parkinglot|
    @parking_lot_booking = ParkingLotBooking.where("parking_space_lot_id = ? AND end_date between ? AND ? AND start_date between ? AND ?",parkinglot.id,@start_date,@end_date,@start_date,@end_date)
    #@parking_lot_booking = ParkingLotBooking.where("parking_space_lot_id = ? ",parkinglot.id)
    if !@parking_lot_booking.nil?       
      @available_lots[parkinglot.id] = @available_lots[parkinglot.id] - get_total_slots(@parking_lot_booking)
    end    
  end
  @available_lots.each do |result_lot|
    @parking_space_lot = ParkingSpaceLot.where(:id =>result_lot[0]).first()
    if !@parking_space_lot.nil?
      @resultant_lots_hash << ParkingSpace.where(:id=>@parking_space_lot.parking_space_id) << result_lot[1]
    end
  end  
  end

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
  
  private 
  def get_date_from_str(date_str)
    @date = nil
    @date = date_str.gsub(" AM","").gsub(" PM","")
    @date = DateTime.strptime(@date, "%m/%d/%Y %H:%M").to_time unless @date.empty?
    @date 
  end
  
  def get_end_date(end_date,start_date)
    end_date = get_date_from_str(end_date)
    if !end_date.nil?
      end_date
    else
      start_date+1.day
    end
  end
  
  def get_total_slots(parking_slots)
    number_of_booked_slots = 0
    parking_slots.each do |slot|
      number_of_booked_slots += slot.number_of_lots_booked
    end
    number_of_booked_slots
  end
end
