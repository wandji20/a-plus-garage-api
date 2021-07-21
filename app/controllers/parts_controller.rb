class PartsController < ApplicationController
  before_action :set_part, only: %i[show update destroy]

  def show
    render json: {
      success: true,
      data: @part
    }
  end

  def create
    @part = Part.new(part_params)

    if @part.save
      render json: {
        success: true,
        data: @part
      }, status: :created, location: @part
    else
      render json: {
        success: false,
        error: @part.errors
      }, status: :unprocessable_entity
    end
  end

  def update
    if @part.update(part_params)
      render json: {
        success: true,
        data: @part
      }, status: :created, location: @part
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
    params.require(:part).permit(:name, :car_id, :life, :count)
  end
end
