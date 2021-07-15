class FuelPumpsController < ApplicationController
  before_action :set_fuel_pump, only: [:show, :update, :destroy]

  # GET /fuel_pumps
  def index
    @fuel_pumps = FuelPump.all

    render json: @fuel_pumps
  end

  # GET /fuel_pumps/1
  def show
    render json: @fuel_pump
  end

  # POST /fuel_pumps
  def create
    @fuel_pump = FuelPump.new(fuel_pump_params)

    if @fuel_pump.save
      render json: @fuel_pump, status: :created, location: @fuel_pump
    else
      render json: @fuel_pump.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /fuel_pumps/1
  def update
    if @fuel_pump.update(fuel_pump_params)
      render json: @fuel_pump
    else
      render json: @fuel_pump.errors, status: :unprocessable_entity
    end
  end

  # DELETE /fuel_pumps/1
  def destroy
    @fuel_pump.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fuel_pump
      @fuel_pump = FuelPump.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fuel_pump_params
      params.fetch(:fuel_pump, {})
    end
end
