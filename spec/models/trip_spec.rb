require 'rails_helper'

describe Trip do
  it "is valid with name, description, start_date, end_date" do
    trip = Trip.new(
      name: "Trip to Yosemite",
      description: "Winter to trip to Yosemite Lodge for snowshoeing",
      start_date: "Tue, 04 Apr 2016",
      end_date: "Tue, 06 Apr 2016"
    )
    expect(trip).to be_valid
  end

  it "is invalid without a name" do
    trip = Trip.new(name: nil)
    trip.valid?
    expect(trip.errors[:name]).to include("can't be blank")
  end

  it "is invalid without a description" do
    trip = Trip.new(description: nil)
    trip.valid?
    expect(trip.errors[:description]).to include("can't be blank")
  end

  it "is invalid without a start_date" do
    trip = Trip.new(start_date: nil)
    trip.valid?
    expect(trip.errors[:start_date]).to include("can't be blank")
  end

  it "is invalid without a end_date" do
    trip = Trip.new(end_date: nil)
    trip.valid?
    expect(trip.errors[:end_date]).to include("can't be blank")
  end

  it "returns the formatted start_date" do
    trip = Trip.new(
      name: "Trip to Yosemite",
      description: "Winter to trip to Yosemite Lodge for snowshoeing",
      start_date: "Tue, 04 Dec 2016",
      end_date: "Tue, 06 Dec 2016"
    )
    expect(trip.start_date_formatter).to eq("December 04, 2016")
  end

  it "returns the formatted end_date" do
    trip = Trip.new(
      name: "Trip to Yosemite",
      description: "Winter to trip to Yosemite Lodge for snowshoeing",
      start_date: "Tue, 04 Dec 2016",
      end_date: "Tue, 06 Dec 2016"
    )
    expect(trip.end_date_formatter).to eq("December 06, 2016")
  end
end
