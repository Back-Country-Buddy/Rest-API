class Api::Private::V1::TourUserController < ApplicationController
  before_action :find_tour, only: %i[ create index ]
  before_action :find_user, only: :create

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

  private

  def find_tour
    @tour = Tour.find(params[:tour_id])
  end

  def find_user
    @user = User.where(email_address: params[:email_address]).first
  end
end
