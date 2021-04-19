class Api::Private::V1::TourController < ApplicationController
  def index
#     MANDATORY: CHANGE THIS LATER, HOTFIX TO ALLOW CREATING USER TO ACCESS ALL TOURS, THIS DOES NOT WORK FOR ADDITIONAL USERS, UPDATE THIS AFTER MAKING USERTOUR TABLE
    tours = Tour.where(creator_id: params[:user_id])
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
  def tour_params
    params.permit(:date, :location, :creator_id, :complete)
  end
end
