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
end