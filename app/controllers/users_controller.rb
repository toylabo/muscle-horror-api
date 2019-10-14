class UsersController < ApplicationController
  def index
    login_user = User.find_by(name: params[:name], password: params[:password])
    if login_user
      render json: { responseCode: 200, token: login_user.token }, status: 200
    else
      render json: {responseCode: 401, message: "invalid name or password."}, status: 401
    end
  end
end
