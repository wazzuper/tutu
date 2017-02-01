class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :hidden_params, only: [:new, :create]

  def index
    @tickets = Ticket.all
  end

  def show
  end

  def new
    @ticket = Ticket.new(new_ticket_params)
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to @ticket
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path
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