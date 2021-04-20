class Api::Private::V1::TourController < ApplicationController
  before_action :find_user, only: :index

  def index
    tours = @user.tours
    begin
      render json: TourSerializer.new(tours)
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

  def find_user
    @user = User.find(params[:user_id])
  end

  def tour_params
    params.permit(:date, :location, :creator_id, :complete)
  end
end
