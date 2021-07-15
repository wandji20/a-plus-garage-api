class OilFiltersController < ApplicationController
  before_action :set_oil_filter, only: [:show, :update, :destroy]

  # GET /oil_filters
  def index
    @oil_filters = OilFilter.all

    render json: @oil_filters
  end

  # GET /oil_filters/1
  def show
    render json: @oil_filter
  end

  # POST /oil_filters
  def create
    @oil_filter = OilFilter.new(oil_filter_params)

    if @oil_filter.save
      render json: @oil_filter, status: :created, location: @oil_filter
    else
      render json: @oil_filter.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /oil_filters/1
  def update
    if @oil_filter.update(oil_filter_params)
      render json: @oil_filter
    else
      render json: @oil_filter.errors, status: :unprocessable_entity
    end
  end

  # DELETE /oil_filters/1
  def destroy
    @oil_filter.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_oil_filter
      @oil_filter = OilFilter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def oil_filter_params
      params.fetch(:oil_filter, {})
    end
end
