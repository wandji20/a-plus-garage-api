class RearLightsController < ApplicationController
  before_action :set_rear_light, only: [:show, :update, :destroy]

  # GET /rear_lights
  def index
    @rear_lights = RearLight.all

    render json: @rear_lights
  end

  # GET /rear_lights/1
  def show
    render json: @rear_light
  end

  # POST /rear_lights
  def create
    @rear_light = RearLight.new(rear_light_params)

    if @rear_light.save
      render json: @rear_light, status: :created, location: @rear_light
    else
      render json: @rear_light.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rear_lights/1
  def update
    if @rear_light.update(rear_light_params)
      render json: @rear_light
    else
      render json: @rear_light.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rear_lights/1
  def destroy
    @rear_light.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rear_light
      @rear_light = RearLight.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rear_light_params
      params.fetch(:rear_light, {})
    end
end
