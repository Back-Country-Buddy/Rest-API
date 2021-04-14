class Api::V1::UserController < ApplicationController
  def index
    begin
      render json: UserSerializer.new(User.all)
    rescue
      render json: {"error" => {}}, status:404
    end
  end

  def show
    begin
      render json: UserSerializer.new(User.find(params[:id]))
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

  def destroy
    User.find(params[:id]).destroy
  end

  private
  def user_params
    params.permit(:user_name, :email_address, :emergency_contact_name, :emergency_number)
  end
end