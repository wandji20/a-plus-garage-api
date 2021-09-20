class CarsController < ApplicationController
  before_action :set_car, only: %i[show update destroy]

  def index
    @cars = current_user.cars

    render json: {
      parts: user_cars,
      cars: @cars.order(created_at: :desc).as_json(only: %i[id make power fuel])
    }
  end

  def create
    @car = current_user.cars.create!(car_params)

    render json: {
      car: @car.as_json(only: %i[id make power fuel], include: [:parts])
    }, status: :created
  end

  def show
    @car = current_user.cars.find(params[:id])
    render json: {
      car: @car.as_json(only: %i[id make power fuel], include: [:parts])
    }
  end

  def update
    if @car.update(car_params)
      render json: @car
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:make, :fuel, :power, :user_id, :id, parts_attributes: %i[name life count])
  end

  def user_cars
    @car_ids = current_user.cars.pluck(:id)
    @parts = Part.where(car_id: @car_ids)
  end
end
