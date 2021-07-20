class CarsController < ApplicationController
  before_action :set_car, only: %i[show update destroy]
  before_create :create_parts
  
  def show
    render json: @car
  end

  def create
    @user = User.find(params[:user_id])
    @car = @user.cars.build(car_params)

    if (@car.parts.length === 8 && @car.save)
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
    params.require(:car).permit(:make, :fuel_rate, :horse_power, :parts);
  end

  def create_parts
    @parts = params[:parts]
    @parts.each do |part|
      @part = self.parts.build(name: part.name, life: part.life)
      @part.save
    end
  end
end
