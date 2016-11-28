# describe Contact do it "is valid with a firstname, lastname and email" it "is invalid without a firstname" it "is invalid without a lastname" it "is invalid without an email address" it "is invalid with a duplicate email address" it "returns a contact's full name as a string" end

require 'rails_helper'

describe Trip do
  it "is valid with name, description, start_date, end_date" do
    trip = Trip.new(
      name: "Trip to Yosemite",
      description: "Winter to trip to Yosemite Lodge for snowshoeing",
      start_date: "12-04-2016",
      end_date: "12-06-2016"
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
end
