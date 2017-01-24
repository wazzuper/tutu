class Wagon < ApplicationRecord
  belongs_to :train

  validates :wagon_type, :top_place, :bottom_place, presence: true
end