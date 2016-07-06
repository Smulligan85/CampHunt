class TripsController < ApplicationController
  def index
    @trips = Trip.where(user_id: current_user.id)
  end

  def results
    response = Faraday.get do |req|
      req.url "http://api.amp.active.com/camping/campgrounds/?"
      req.params['api_key'] = Rails.application.secrets.active_api_key
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
    response = Faraday.get do |req|
      req.url "http://api.amp.active.com/camping/campground/details?"
      req.params['api_key'] = Rails.application.secrets.active_api_key
      req.params['contractCode'] = params[:contract_code]
      req.params['parkId'] = params[:park_id]
    end
    json = JSON.parse(Hash.from_xml(response.body).to_json)
    @description = json["detailDescription"]["description"]
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

  def update
    @trip = Trip.find(params[:id])
    @trip.update(trip_params)
    if @trip.save
      redirect_to trip_path(@trip)
    else
      flash[:error] = "Trip could not be updated"
      redirect_to trip_path(@trip)
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :description, :start_date, :end_date, :user_id, :supplies_attributes => [:name])
  end
end
