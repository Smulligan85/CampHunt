require 'rails_helper'

describe User do

  it "is valid with email and password" do 
    user = User.new(
      email: "foobar@example.com",
      password: "helloworld")
    expect(user).to be_valid
  end

  it "is invalid without an email" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid without an password" do
    user = User.new(password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
 end

 it "is invalid with duplicate email" do
    User.create(
      email: "foobar@example.com",
      password: "helloworld")

    user = User.new(
      email: "foobar@example.com",
      password: "helloworld")

    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
end
