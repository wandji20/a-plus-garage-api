class BrakesController < ApplicationController
  before_action :set_brake, only: [:show, :update, :destroy]

  # GET /brakes
  def index
    @brakes = Brake.all

    render json: @brakes
  end

  # GET /brakes/1
  def show
    render json: @brake
  end

  # POST /brakes
  def create
    @brake = Brake.new(brake_params)

    if @brake.save
      render json: @brake, status: :created, location: @brake
    else
      render json: @brake.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /brakes/1
  def update
    if @brake.update(brake_params)
      render json: @brake
    else
      render json: @brake.errors, status: :unprocessable_entity
    end
  end

  # DELETE /brakes/1
  def destroy
    @brake.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brake
      @brake = Brake.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def brake_params
      params.fetch(:brake, {})
    end
end
