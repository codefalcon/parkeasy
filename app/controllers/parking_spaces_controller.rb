class ParkingSpacesController < ApplicationController
  include ApplicationHelper
  # GET /parking_spaces
  # GET /parking_spaces.json
  before_filter :authenticate_user!, :only=>[:new]
  def index
    @parking_spaces = ParkingSpace.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @parking_spaces }
    end
  end

  # GET /parking_spaces/1
  # GET /parking_spaces/1.json
  def show
    @parking_space = ParkingSpace.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @parking_space }
    end
  end

  # GET /parking_spaces/new
  # GET /parking_spaces/new.json
def new
    @parking_space = ParkingSpace.new
    @allowed_vehicle_types = AllowedVehicleType.AllowedVehicleTypes().to_a
    @preferred_duration_types =  PreferredDurationType.PreferredDurationTypes().to_a
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @parking_space }
    end
  end


  # GET /parking_spaces/1/edit
  def edit
    @parking_space = ParkingSpace.find(params[:id])
    @allowed_vehicle_types = AllowedVehicleType.AllowedVehicleTypes().to_a
    @preferred_duration_types =  PreferredDurationType.PreferredDurationTypes().to_a
  end

  # POST /parking_spaces
  # POST /parking_spaces.json
  def create
    @parking_space = ParkingSpace.new(params[:parking_space])
    @parking_space.location_x = @parking_space.location_x.to_f
    @parking_space.location_y = @parking_space.location_y.to_f
    @parking_space.user = current_user
    @parking_space_lot = ParkingSpaceLot.new(params[:parking_space_lot])
 
   
    respond_to do |format|
      if @parking_space.save
        puts @parking_space_lot.start_date
        @parking_space_lot.parking_space = @parking_space
        @parking_space_lot.save!
        format.html { redirect_to '/parking_spaces', notice: 'Parking space was successfully created.' }
        #format.json { render json: @parking_spaces, status: :created, location: @parking_spaces }
      else
        format.html { render action: "new" }
        format.json { render json: @parking_space.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /parking_spaces/1
  # PUT /parking_spaces/1.json
  def update
    @parking_space = ParkingSpace.find(params[:id])

    respond_to do |format|
      if @parking_space.update_attributes(params[:parking_space])
        format.html { redirect_to @parking_space, notice: 'Parking space was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @parking_space.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parking_spaces/1
  # DELETE /parking_spaces/1.json
  def destroy
    @parking_space = ParkingSpace.find(params[:id])
    @parking_space.destroy

    respond_to do |format|
      format.html { redirect_to parking_spaces_url }
      format.json { head :no_content }
    end
  end
  def search_listing
    @resultant_lots_hash = params[:resultant_lots_hash]
    @parking_spaces = []
    if !@resultant_lots_hash.nil?   
      @resultant_lots_hash.each do |r|
        parking_spaceid = r["one"]
        space = ParkingSpace.where(:id=>parking_spaceid).first()
        if !space.nil?
          @parking_spaces << space
        end 
      end    
    end
  end
end
