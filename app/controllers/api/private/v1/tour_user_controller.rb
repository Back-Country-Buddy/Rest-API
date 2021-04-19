class Api::Private::V1::TourUserController < ApplicationController
  before_action :find_tour, :find_user, only: :create, :index

  def index
    user = @tour.users
    begin
      render json: UserSerializer.new(users)
    rescue
      render json: {"error" => {}}, status: 404
    end
  end

  def create
    TourUser.create!(@tour, @user)
  end

  private

  def find_tour
    @tour = Tour.where(id: params[:tour_id])
  end

  def find_user
    @user = User.where(email_address: params[:email_address])
  end
end
