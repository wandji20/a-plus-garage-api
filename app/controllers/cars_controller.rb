class CarsController < ApplicationController
  before_action :set_car, only: %i[show update destroy]

  def show
    render json: {
      success: true,
      data: {
        car: @car.as_json(only: %i[id make power fuel], include: [:parts])
      }
    }
  end

  # def create
  #   @user = User.find(params[:user_id])
  #   @car = @user.cars.build(car_params)

  #   @parts = params[:parts]

  #   if @car.save

  #     @parts.each do |part|
  #       @part = @car.parts.new(name: part[:name], life: part[:life], count: 1)
  #       @part.save if @part.valid?
  #     end

  #     render json: {
  #       success: true,
  #       data: {
  #         car: @car.as_json(only: %i[name fuel power id], include: [:parts])
  #       }
  #     }
  #   else
  #     render json: {
  #       success: false,
  #       errors: @car.errors
  #     }, status: :unprocessable_entity
  #   end
  # end

  def index
    # get current user todos
    @cars = current_user.cars
    json_response(@cars)
  end

  def create
    # create todos belonging to current user
    @car = current_user.cars.create!(car_params)
    json_response(@car, :created)
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
    params.require(:car).permit(:make, :fuel, :power, :parts, :user_id, :id)
  end
end
