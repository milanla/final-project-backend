class LikesController < ApplicationController

  # before_action :authorized

  def create
    @like = Like.create(like_params)

    render json: @like
  end

  def user_likes
    @user = User.find_by_username(params[:username])
    # byebug
    @user_likes = @user.liked_slangs

    render json: @user_likes
  end

  def destroy
    # byebug
    @like = Like.find(params[:id])
    @like.destroy
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :liked_slang_id)
  end

end
