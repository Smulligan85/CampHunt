class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
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
end
