class Admin::TrainsController < Admin::BaseController
  before_action :set_train, only: [:show, :edit, :update, :destroy]

  def index
    @trains = Train.all
  end

  def show
  end

  def new
    @train = Train.new
  end

  def edit
  end

  def create
    @train = Train.new(train_params)

    respond_to do |format|
      if @train.save
        format.html { redirect_to [:admin, @train], notice: 'Поезд был успешно создан' }
        # format.json { render :show, status: :created, location: @train }
      else
        format.html { render :new }
        # format.json { render json: @train.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @train.update(train_params)
        format.html { redirect_to [:admin, @train], notice: 'Поезд был обновлен' }
        # format.json { render :show, status: :ok, location: @train }
      else
        format.html { render :edit }
        # format.json { render json: @train.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @train.destroy
    respond_to do |format|
      format.html { redirect_to admin_trains_url, notice: 'Поезд был удален' }
      # format.json { head :no_content }
    end
  end

  private
    def set_train
      @train = Train.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def train_params
      params.require(:train).permit(:number, :current_station_id, :route_id, :sort_wagon)
    end
end
