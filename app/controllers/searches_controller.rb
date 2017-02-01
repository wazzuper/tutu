class SearchesController < ApplicationController
  def show
    @search ||= Search.new
  end

  def create
    @search = Search.new(search_params)
    @search.do_search
    render :show
  end

  private

  def search_params
    params.require(:search).permit(:first_station_id, :last_station_id)
  end
end