class LikedSlangsController < ApplicationController

  def index
    @liked_slangs = LikedSlang.all

    render json: @liked_slangs
  end

  def create
    @liked_slang = LikedSlang.find_or_create_by(liked_slang_params)
    # byebug
    render json: @liked_slang
  end

  def destroy
    @liked_slang = Like.find_by(liked_slang_id: params[:id])
    # byebug
    @liked_slang.destroy

    render json: { "message": "unliked" }
  end

  private

  def liked_slang_params
    params.require(:liked_slang).permit(:author, :term, :definition, :example)
  end
end
