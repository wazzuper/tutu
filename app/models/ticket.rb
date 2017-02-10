class Ticket < ApplicationRecord
  belongs_to :train
  belongs_to :first_station, class_name: 'RailwayStation', foreign_key: :first_station_id
  belongs_to :last_station, class_name: 'RailwayStation', foreign_key: :last_station_id
  belongs_to :user, required: false

  after_create :send_notification
  after_destroy :send_refund_notification

  validates :fio, :document, presence: true

  def route_name
    "#{first_station.title} - #{last_station.title}"
  end

  private

  def send_notification
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end

  def send_refund_notification
    TicketsMailer.refund_ticket(self.user, self).deliver_now
  end
end