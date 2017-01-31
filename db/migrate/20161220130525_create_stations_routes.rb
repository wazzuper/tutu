class CreateStationsRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :railway_stations_routes do |t|
      t.integer :railway_station_id
      t.integer :route_id
      t.integer :number
      t.time :arrival_time
      t.time :departure_time
    end
  end
end
