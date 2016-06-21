class TripsController < ApplicationController
  def new
    @trip = Trip.new
    @name = params[:name]
  end

  def create
    @trip = current_user.trips.create(trip_params)
    if @trip.save
      flash[:notice] = "Trip Saved"
    else
      flash[:error] = "Trip could not be saved"
    end
    redirect_to root_path
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :start_date, :end_date)
  end
end
