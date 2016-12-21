class Ticket < ApplicationRecord
  validates :number, presence: true

  belongs_to :train
  belongs_to :route
  belongs_to :user
end