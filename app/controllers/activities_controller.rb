class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:edit, :update, :destroy]
  before_action :set_trip
  before_action :authenticate_user!

  # GET /activities
  def index; end

  # GET /activities/new
  def new
    @activity = Activity.new
  end

  # GET /activities/:id/edit
  def edit; end

  # POST /activities
  def create
    @activity = Activity.new(activity_params)
    @activity.trip = @trip

    respond_to do |format|
      if @activity.save
        format.html {
          redirect_to @trip,
          notice: 'Activity was successfully created.'
        }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /activities/:id
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html {
          redirect_to @trip,
          notice: 'Activity was successfully updated.'
        }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /activities/:id
  def destroy
    @activity.destroy

    respond_to do |format|
      format.html {
        redirect_to @trip,
        notice: 'Activity was successfully destroyed.'
      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:trip_id])
    end

    def set_activity
      @activity = Activity.find(params[:id])
    end

    def activity_params
      params.require(:activity).permit(
        :title, :status, :trip_id
      )
    end
end
