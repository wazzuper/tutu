class RailwayStation < ApplicationRecord
  has_many :trains
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true

  scope :ordered, -> { joins(:railway_stations_routes).order("railway_stations_routes.number").distinct }

  def update_position(route, number)
    station_route = station_route(route)
    station_route.update(number: number) if station_route
  end

  def update_time(route, arrival_time, departure_time)
    station_route = station_route(route)
    station_route.update(arrival_time: arrival_time, departure_time: departure_time) if station_route
  end

  def position_in(route)
    station_route(route).try(:number)
  end

  def arrival_time_in(route)
    time = station_route(route).try(:arrival_time)
    time.strftime('%T') unless time.nil?
  end

  def departure_time_in(route)
    time = station_route(route).try(:departure_time)
    time.strftime('%T') unless time.nil?
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end
