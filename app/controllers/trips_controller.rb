class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /trips
  def index
    trips = current_user.trips
    @trips = trips.paginate(:page => params[:page], per_page: 5)
  end

  # GET /trips/:id
  def show
    @budget_items = @trip.budget_items
    @activities = @trip.activities
  end

  # GET /trips/new
  def new
    @trip = Trip.new
  end

  # GET /trips/:id/edit
  def edit
  end

  # POST /trips
  def create
    @trip = current_user.trips.new(trip_params)

    respond_to do |format|
      if @trip.save
        format.html {
          redirect_to trips_path,
          notice: 'Trip was successfully created.'
        }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /trips/:id
  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html {
          redirect_to @trip,
          notice: 'Trip was successfully updated.'
        }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /trips/:id
  def destroy
    @trip.destroy
    respond_to do |format|
      format.html {
        redirect_to trips_url,
        notice: 'Trip was successfully destroyed.'
      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = current_user.trips.find(params[:id])
    end

    def trip_params
      params.require(:trip).permit(
        :name, :description, :location,
        :departure_date, :return_date
      )
    end
end
