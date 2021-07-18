class CarsController < ApplicationController
  before_action :set_car, only: %i[show update destroy]

  def show
    render json: @car
  end

  def create
    @car = Car.new(car_params)
    @parts = [
      Part.new(name: 'Oil'),
      Part.new(name: 'Oil Filter'),
      Part.new(name: 'Brakes Lining'),
      Part.new(name: 'Tyres'),
      Part.new(name: 'Rear Lights'),
      Part.new(name: 'Fuel Pump')
    ]

    if @car.save
      # @parts.each do |part|
      #   @car.part.build()
      #   part.save if part.valid?
      # end
      render json: {
        success: true,
        data: {
          car: @car.as_json(only: [:name], include: [:parts])
        }
      }
    else
      render json: {
        success: false,
        errors: @car.errors
      }, status: :unprocessable_entity
    end
  end

  def update
    if @car.update(car_params)
      render json: @car
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @car.destroy
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:make, :fuel_rate, :horse_power)
  end
end
