class EconomyWagon < Wagon
  validates :side_top_seats, :side_bottom_seats, presence: true
end