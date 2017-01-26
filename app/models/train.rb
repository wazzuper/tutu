class Train < ApplicationRecord
  has_many :wagons
  has_many :tickets
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route

  validates :number, presence: true

  def sort_wagons
    sort_wagon ? wagons.sort_10 : wagons.sort_01
  end

  def seats_amount(wagon_type, seats_type)
    wagons.where(type: wagon_type).sum(seats_type)
  end
end
