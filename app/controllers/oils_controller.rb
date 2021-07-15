class OilsController < ApplicationController
  before_action :set_oil, only: [:show, :update, :destroy]

  # GET /oils
  def index
    @oils = Oil.all

    render json: @oils
  end

  # GET /oils/1
  def show
    render json: @oil
  end

  # POST /oils
  def create
    @oil = Oil.new(oil_params)

    if @oil.save
      render json: @oil, status: :created, location: @oil
    else
      render json: @oil.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /oils/1
  def update
    if @oil.update(oil_params)
      render json: @oil
    else
      render json: @oil.errors, status: :unprocessable_entity
    end
  end

  # DELETE /oils/1
  def destroy
    @oil.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_oil
      @oil = Oil.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def oil_params
      params.fetch(:oil, {})
    end
end
