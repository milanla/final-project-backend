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

  def search
    @search_res = UrbanscraperAdapter.get_slang(params[:term])

    render json: @search_res
  end

  private

  def slang_params
    params.require(:slang).permit(:term, :definition, :example)
  end

end
