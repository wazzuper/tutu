class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :hidden_params, only: [:new, :create]
  before_action :set_ticket, only: [:show, :destroy]

  def index
    @tickets = current_user.tickets
  end

  def show
  end

  def new
    @ticket = Ticket.new(new_ticket_params)
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)

    if @ticket.save
      redirect_to @ticket, notice: 'Вы купили билет'
    else
      render :new
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path, notice: 'Билет отменен'
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:train_id, :first_station_id, :last_station_id, :fio, :document)
  end

  def new_ticket_params
    params.require(:ticket).permit(:train_id, :first_station_id, :last_station_id)
  end

  def hidden_params
    @train = Train.find(new_ticket_params[:train_id])
    @first_station = RailwayStation.find(new_ticket_params[:first_station_id])
    @last_station = RailwayStation.find(new_ticket_params[:last_station_id])
  end
end