class DestinationsController < ApplicationController
  before_action :set_destination, only: [:show, :update]

  def index
    @destinations = Destination.all
    render json: @destinations
  end

  def show
    render json: @destination
  end

  def create
    @destination = Destination.new(destination_params)
    if @destination.save
      render json: @destination
    else
      render json: {errors: @destination.errors.full_messages}, status: 422
    end
  end

  def update
    if @destination.update(params[:destination])
      render json: @destination
    else
      render json: {error: @destination.errors.full_messages}, status: 422
    end
  end

  private

  def destination_params
    params.require(:destination).permit(:name, :description, :lat, :lng)
  end

  def set_destination
    @destination = Destination.find_by(id: params[:id])
  end

end
