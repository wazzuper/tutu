class Search
  include ActiveModel::Model
  
  attr_accessor :arrival_station_id, :departure_station_id

  def search_routes
    Route.joins(:railway_stations_routes).where(['railway_stations_routes.railway_station_id = ?', arrival_station_id]) &
      Route.joins(:railway_stations_routes).where(['railway_stations_routes.railway_station_id = ?', departure_station_id])
  end
end