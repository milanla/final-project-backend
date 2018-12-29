class SlangsController < ApplicationController

  skip_before_action :authorized, only: [:search, :index]

  def index
    @slangs = Slang.all

    render json: @slangs
  end

  def show
    @slang = Slang.find(params[:id])

    render json: @slang
  end

  def create
    @slang = Slang.create(slang_params)

    render json: @slang
  end

  def user_slangs
    @user = User.find_by_username(params["username"])
    @user_slangs = @user.slangs
    
    render json: @user_slangs
  end

  def search
    @search_res = UrbanscraperAdapter.get_slang(params[:term])

    render json: @search_res
  end

  private

  def slang_params
    params.require(:slang).permit(:user_id, :term, :definition, :example)
  end

end
