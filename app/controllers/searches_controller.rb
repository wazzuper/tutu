class SearchesController < ApplicationController
  def show
    @stations = RailwayStation.all
  end

  def create
    @stations = RailwayStation.all
    @search = Search.new(search_params)
    @routes = @search.search_routes
    render :show
  end

  private

  def search_params
    params.require(:search).permit(:arrival_station_id, :departure_station_id)
  end
end