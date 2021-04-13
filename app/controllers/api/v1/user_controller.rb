class Api::V1::UserController < ApplicationController
  def index
    begin
      render json: UserSerializer.new(User.all)
    rescue
      render json: {"error" => {}}, status:404
    end
  end
end