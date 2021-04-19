class Api::Private::V1::TourController < ApplicationController
  def index
    begin
      render json: TourSerializer.new(Tour.all)
    rescue
      render json: {"error" => {}}, status: 404
    end
  end

  def show
    begin
      render json: TourSerializer.new(Tour.find(params[:id]))
    rescue
      render json: {"error" => {}}, status: 404
    end
  end

  def update
    begin
      tour = Tour.find(params[:id])
      tour.update!(tour_params)
      render json: TourSerializer.new(tour), status:202
    rescue
      render json: {"error" => {}}, status: 404
    end
  end

  def create
    user = User.find(params[:creator_id])
    tour = user.tours.create!(tour_params)
    begin
      render json: TourSerializer.new(tour)
    rescue
      render json: {"error" => {}}, status: 404
    end
  end

  def destroy
    Tour.find(params[:id]).destroy
  end

  private
  def tour_params
    params.permit(:date, :location, :creator_id, :complete)
  end
end
