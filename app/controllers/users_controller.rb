class UsersController < ApplicationController
  def index
    login_user = User.find_by(name: params[:name], password: params[:password])
    if login_user
      render json: { responseCode: 200, token }
    else

    end
  end
end
