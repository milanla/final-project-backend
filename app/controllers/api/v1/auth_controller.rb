class Api::V1::AuthController < ApplicationController

  skip_before_action :authorized, only: [:create]

  def create
    @user = User.find_by(username: login_user_params[:username])
    if @user && @user.authenticate(login_user_params[:password])
      @token = issue_token({id: @user.id}, 'SECRET')
      render json: {user: @user, jwt: @token}
    else
      render json: { error: 'Invalid username or password' }, status: 400
    end
  end

  def show
    id = decode_token["id"]
    @user = User.find(id)
    if @user
      render json: { user: @user }, status: 200
    else
      render json: { error: 'user not found' }, status: 422
    end
  end

  private

  def login_user_params
    params.require(:user).permit(:username, :password)
  end

end
