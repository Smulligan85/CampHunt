require 'rails_helper'

describe TripSupply do
  let(:trip) do
    Trip.create(
      name: "Trip to Yosemite",
      description: "Winter to trip to Yosemite Lodge for snowshoeing",
      start_date: "Tue, 04 Apr 2016",
      end_date: "Tue, 06 Apr 2016"
    )
  end

  let(:supply) do
    Supply.create(
      name: "Tent"
    )
  end

  it "increases the quantity by one" do
    trip.supplies << supply
    test_trip_supply = trip.trip_supplies.first
    expect(test_trip_supply.increase_quantity).to eq(2)
  end

  it "decreases the quantity by one" do
    trip.supplies << supply
    test_trip_supply = trip.trip_supplies.first
    test_trip_supply.increase_quantity
    test_trip_supply.save
    expect(test_trip_supply.decrease_quantity).to eq(1)
  end
end
