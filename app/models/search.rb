class Search
  include ActiveModel::Model
  
  attr_accessor :first_station_id, :last_station_id
  attr_reader :search_result

  def find_arrival_station
    @arrival_station ||= RailwayStation.find(first_station_id)
  end

  def find_departure_station
    @departure_station ||= RailwayStation.find(last_station_id)
  end

  def do_search
    @search_result = Train.includes(route: :railway_stations).where(railway_stations: { id: first_station_id }) &
                     Train.includes(route: :railway_stations).where(railway_stations: { id: last_station_id })
  end
end