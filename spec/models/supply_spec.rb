require 'rails_helper'

describe Supply do
  it "is valid with name" do
    supply = Supply.new(name: "Tent")
    expect(supply).to be_valid
  end

  it "is invalid without a name" do
    supply = Supply.new(name: nil)
    supply.valid?
    expect(supply.errors[:name]).to include("can't be blank")
  end

end
