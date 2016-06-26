class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def results
    response = Faraday.get do |req|
      req.url "http://api.amp.active.com/camping/campgrounds/?"
      req.params['api_key'] = Rails.application.secrets.api_key
      req.params['pname'] = params["pname"]
    end
    @json = JSON.parse(Hash.from_xml(response.body).to_json)
    if @json["resultset"]["count"] == "0"
      flash[:error] = "Park not found"
      redirect_to root_path
    end
  end

  def new
    @trip = Trip.new
    @name = params[:name]
  end

  def create
    @trip = current_user.trips.create(trip_params)
    if @trip.save
      flash[:notice] = "Trip Saved"
      redirect_to trip_path(@trip)
    else
      flash[:error] = "Trip could not be saved"
      redirect_to root_path
    end
  end

  def show
    @trip = Trip.find(params[:id])
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :start_date, :end_date, :user_id, :supplies_attributes => [:name])
  end
end
