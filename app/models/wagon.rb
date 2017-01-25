class Wagon < ApplicationRecord
  belongs_to :train

  validates :number, :wagon_type, presence: true
  validates :number, uniqueness: { scope: :train_id }

  before_validation :set_type, :set_number

  private

  def set_type
    if self.wagon_type == 'Купе'
      self.type = 'CoupeWagon'
    elsif self.wagon_type == 'Плацкарт'
      self.type = 'EconomyWagon'
    elsif self.wagon_type == 'СВ'
      self.type = 'SwWagon'
    elsif self.wagon_type == 'Сидячие места'
      self.type = 'SittingWagon'
    end     
  end

  def set_number
    numb = Wagon.where(train_id: train).maximum(:number)
    self.number = numb ? numb + 1 : 1
  end
end