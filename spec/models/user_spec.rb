require 'rails_helper'

RSpec.describe "User", type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      user = User.new(
        first_name: "TestFirstName",
        last_name: "TestLastName",
        email: "test@example.com",
        password: "password"
      )
      expect(user).to be_valid
    end

    it "is not valid without a first name" do
      user = User.new(
        first_name: nil,
        last_name: "TestLastName",
        email: "test@example.com",
        password: "password"
      )
      expect(user).to_not be_valid
    end

    it "is not valid without a last name" do
      user = User.new(
        first_name: "TestFirstName",
        last_name: nil,
        email: "test@example.com",
        password: "password"
      )
      expect(user).to_not be_valid
    end

    it "is not valid without an email" do
      user = User.new(
        first_name: "TestFirstName",
        last_name: "TestLastName",
        email: nil,
        password: "password"
      )
      expect(user).to_not be_valid
    end

    it "is not valid without a password" do
      user = User.new(
        first_name: "TestFirstName",
        last_name: "TestLastName",
        email: "test@example.com",
        password: nil
      )
      expect(user).to_not be_valid
    end
  end

  # describe "associations" do
  #   it { should have_many(:park_visits) }
  # end
end
