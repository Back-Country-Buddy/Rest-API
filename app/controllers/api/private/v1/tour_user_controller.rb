class Api::Private::V1::TourUserController < ApplicationController
  before_action :find_tour, only: %i[ create index destroy ]
  before_action :find_user, only: %i[ create destroy ]
  before_action :find_tour_user, only: :destroy

  def index
    users = @tour.users
    begin
      render json: UserSerializer.new(users)
    rescue
      render json: {"error" => {}}, status: 404
    end
  end

  def create
    # binding.pry
    TourUser.create!(tour: @tour, user: @user)
  end

  def destroy
    @tour_user
  end

  private

  def find_tour
    @tour = Tour.find(params[:tour_id])
  end

  def find_user
    @user = User.where(email_address: (params[:email_address].downcase)).first
  end

  def find_tour_user
    @tour_user = TourUser.where(tour_id: @tour.id, user_id: @user.id).first.class
  end
end
