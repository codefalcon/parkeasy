class ParkingSpaceLotPricesController < ApplicationController
  # GET /parking_space_lot_prices
  # GET /parking_space_lot_prices.json
  def index
    @parking_space_lot_prices = ParkingSpaceLotPrice.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @parking_space_lot_prices }
    end
  end

  # GET /parking_space_lot_prices/1
  # GET /parking_space_lot_prices/1.json
  def show
    @parking_space_lot_price = ParkingSpaceLotPrice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @parking_space_lot_price }
    end
  end

  # GET /parking_space_lot_prices/new
  # GET /parking_space_lot_prices/new.json
  def new
    @parking_space_lot_price = ParkingSpaceLotPrice.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @parking_space_lot_price }
    end
  end

  # GET /parking_space_lot_prices/1/edit
  def edit
    @parking_space_lot_price = ParkingSpaceLotPrice.find(params[:id])
  end

  # POST /parking_space_lot_prices
  # POST /parking_space_lot_prices.json
  def create
    @parking_space_lot_price = ParkingSpaceLotPrice.new(params[:parking_space_lot_price])

    respond_to do |format|
      if @parking_space_lot_price.save
        format.html { redirect_to @parking_space_lot_price, notice: 'Parking space lot price was successfully created.' }
        format.json { render json: @parking_space_lot_price, status: :created, location: @parking_space_lot_price }
      else
        format.html { render action: "new" }
        format.json { render json: @parking_space_lot_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /parking_space_lot_prices/1
  # PUT /parking_space_lot_prices/1.json
  def update
    @parking_space_lot_price = ParkingSpaceLotPrice.find(params[:id])

    respond_to do |format|
      if @parking_space_lot_price.update_attributes(params[:parking_space_lot_price])
        format.html { redirect_to @parking_space_lot_price, notice: 'Parking space lot price was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @parking_space_lot_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parking_space_lot_prices/1
  # DELETE /parking_space_lot_prices/1.json
  def destroy
    @parking_space_lot_price = ParkingSpaceLotPrice.find(params[:id])
    @parking_space_lot_price.destroy

    respond_to do |format|
      format.html { redirect_to parking_space_lot_prices_url }
      format.json { head :no_content }
    end
  end
end
