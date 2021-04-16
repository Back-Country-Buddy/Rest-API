class Api::Private::V1::UserController < ApplicationController
  def index
    begin
      render json: UserSerializer.new(User.all)
    rescue
      render json: {"error" => {}}, status:404
    end
  end

  def show
    begin
      render json: UserSerializer.new(User.where(email_address: params[:email]))
    rescue
      render json: {"error" => {}}, status:404
    end
  end

  def create
    user = User.create!(user_params)
    begin
      render json: UserSerializer.new(user)
    rescue
      render json: {"error" => {}}, status:404
    end
  end

  def update
    begin
      user = User.find(params[:id])
      user.update!(user_params)
      render json: UserSerializer.new(user), status:202
    rescue
      render json: {"error" => {}}, status:404
    end
  end

  def destroy
    User.find(params[:id]).destroy
  end

  private
  def user_params
    params.permit(:user_name, :email_address, :emergency_contact_name, :emergency_number, :auth)
  end
end
