class PartsController < ApplicationController
  before_action :set_part, only: %i[show update destroy]

  def show
    render json: {
      success: true,
      part: @part
    }
  end

  def create
    @part = Part.new(part_params)

    if @part.save
      render json: {
        success: true,
        part: @part
      }, status: :created
    else
      render json: {
        success: false,
        error: @part.errors
      }, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:user_id]);
    if @part.update(count: params[:count]);
      render json: {
        success: true,
        part: @part
      }, status: :created, location: user_car_part_path(@part)
    else
      render json: {
        success: false,
        error: @part.errors
      }, status: :unprocessable_entity
    end
  end

  private

  def set_part
    @part = Part.find(params[:id])
  end

  def part_params
    params.require(:part).permit(:name, :car_id, :user_id, :life, :count, :id)
  end
end
