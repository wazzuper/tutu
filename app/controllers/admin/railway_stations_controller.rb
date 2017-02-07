class Admin::RailwayStationsController < Admin::BaseController
  before_action :set_railway_station, only: [:show, :edit, :update, :destroy, :update_position, :update_time]
  before_action :set_route, only: [:update_position, :update_time]

  def index
    @railway_stations = RailwayStation.all
  end

  def show
  end

  def new
    @railway_station = RailwayStation.new
  end

  def edit
  end

  def create
    @railway_station = RailwayStation.new(railway_station_params)

    respond_to do |format|
      if @railway_station.save
        format.html { redirect_to [:admin, @railway_station], notice: 'Станция была успешно добавлена' }
        # format.json { render :show, status: :created, location: @railway_station }
      else
        format.html { render :new }
        # format.json { render json: @railway_station.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @railway_station.update(railway_station_params)
        format.html { redirect_to [:admin, @railway_station], notice: 'Станция обновлена' }
        # format.json { render :show, status: :ok, location: @railway_station }
      else
        format.html { render :edit }
        # format.json { render json: @railway_station.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_position
    @railway_station.update_position(@route, params[:number])
    redirect_to @route
  end

  def update_time
    @railway_station.update_time(@route, params[:arrival_time], params[:departure_time])
    redirect_to @route
  end

  def destroy
    @railway_station.destroy
    respond_to do |format|
      format.html { redirect_to admin_railway_stations_url, notice: 'Станция удалена' }
      # format.json { head :no_content }
    end
  end

  private
    def set_railway_station
      @railway_station = RailwayStation.find(params[:id])
    end

    def set_route
      @route = Route.find(params[:route_id])
    end

    def railway_station_params
      params.require(:railway_station).permit(:title)
    end
end
