class LikesControllerController < ApplicationController

  before_action :authorized

  def create
    @like = Like.create(like_params)

    render json: @like
  end

  def destroy
    byebug
    @like = Like.find(params[:id])
    @like.destroy
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :slang_id)
  end

end
