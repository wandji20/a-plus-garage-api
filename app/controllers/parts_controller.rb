class PartsController < ApplicationController
  before_action :set_part, only: %i[show destroy update]

  def show
    render json: {
      part: @part
    }
  end

  def create
    @part = Part.new(part_params)

    if @part.save
      render json: {
        part: @part.as_json
      }, status: :created
    else
      render json: {
        error: @part.errors
      }, status: :unprocessable_entity
    end
  end

  def update
    if @part.update(count: params[:count])
      render json: {
        part: @part.as_json
      }, status: :created
    else
      render json: {
        error: @part.errors
      }, status: :unprocessable_entity
    end
  end

  private

  def set_part
    @part = Part.find(params[:id])
  end

  def part_params
    params.require(:part).permit(:name, :car_id, :life, :count, :id)
  end
end
