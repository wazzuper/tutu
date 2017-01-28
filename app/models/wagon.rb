class Wagon < ApplicationRecord
  TYPES = {
    'Купе' => 'CoupeWagon',
    'Плацкарт' => 'EconomyWagon',
    'СВ' => 'SwWagon',
    'Сидячие места' => 'SittingWagon'
  }

  belongs_to :train

  validates :number, presence: true
  validates :number, uniqueness: { scope: :train_id }

  before_validation :set_number

  scope :sort_10, -> { order(:number) }
  scope :sort_01, -> { order('number DESC') }

  private

  def set_number
    numb = Wagon.where(train_id: train).maximum(:number)
    self.number = numb ? numb + 1 : 1
  end
end