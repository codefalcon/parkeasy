class ParkingSpaceLotsController < ApplicationController
  # GET /parking_space_lots
  # GET /parking_space_lots.json
  def index
    @parking_space_lots = ParkingSpaceLot.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @parking_space_lots }
    end
  end

  # GET /parking_space_lots/1
  # GET /parking_space_lots/1.json
  def show
    @parking_space_lot = ParkingSpaceLot.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @parking_space_lot }
    end
  end

  # GET /parking_space_lots/new
  # GET /parking_space_lots/new.json
  def new
    @parking_space_lot = ParkingSpaceLot.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @parking_space_lot }
    end
  end

  # GET /parking_space_lots/1/edit
  def edit
    @parking_space_lot = ParkingSpaceLot.find(params[:id])
  end

  # POST /parking_space_lots
  # POST /parking_space_lots.json
  def create
    @parking_space_lot = ParkingSpaceLot.new(params[:parking_space_lot])

    respond_to do |format|
      if @parking_space_lot.save
        format.html { redirect_to @parking_space_lot, notice: 'Parking space lot was successfully created.' }
        format.json { render json: @parking_space_lot, status: :created, location: @parking_space_lot }
      else
        format.html { render action: "new" }
        format.json { render json: @parking_space_lot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /parking_space_lots/1
  # PUT /parking_space_lots/1.json
  def update
    @parking_space_lot = ParkingSpaceLot.find(params[:id])

    respond_to do |format|
      if @parking_space_lot.update_attributes(params[:parking_space_lot])
        format.html { redirect_to @parking_space_lot, notice: 'Parking space lot was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @parking_space_lot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parking_space_lots/1
  # DELETE /parking_space_lots/1.json
  def destroy
    @parking_space_lot = ParkingSpaceLot.find(params[:id])
    @parking_space_lot.destroy

    respond_to do |format|
      format.html { redirect_to parking_space_lots_url }
      format.json { head :no_content }
    end
  end
end
