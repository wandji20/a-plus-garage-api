class TyresController < ApplicationController
  before_action :set_tyre, only: [:show, :update, :destroy]

  # GET /tyres
  def index
    @tyres = Tyre.all

    render json: @tyres
  end

  # GET /tyres/1
  def show
    render json: @tyre
  end

  # POST /tyres
  def create
    @tyre = Tyre.new(tyre_params)

    if @tyre.save
      render json: @tyre, status: :created, location: @tyre
    else
      render json: @tyre.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tyres/1
  def update
    if @tyre.update(tyre_params)
      render json: @tyre
    else
      render json: @tyre.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tyres/1
  def destroy
    @tyre.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tyre
      @tyre = Tyre.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tyre_params
      params.fetch(:tyre, {})
    end
end
