class RadiatorCoolantsController < ApplicationController
  before_action :set_radiator_coolant, only: [:show, :update, :destroy]

  # GET /radiator_coolants
  def index
    @radiator_coolants = RadiatorCoolant.all

    render json: @radiator_coolants
  end

  # GET /radiator_coolants/1
  def show
    render json: @radiator_coolant
  end

  # POST /radiator_coolants
  def create
    @radiator_coolant = RadiatorCoolant.new(radiator_coolant_params)

    if @radiator_coolant.save
      render json: @radiator_coolant, status: :created, location: @radiator_coolant
    else
      render json: @radiator_coolant.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /radiator_coolants/1
  def update
    if @radiator_coolant.update(radiator_coolant_params)
      render json: @radiator_coolant
    else
      render json: @radiator_coolant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /radiator_coolants/1
  def destroy
    @radiator_coolant.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_radiator_coolant
      @radiator_coolant = RadiatorCoolant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def radiator_coolant_params
      params.fetch(:radiator_coolant, {})
    end
end
