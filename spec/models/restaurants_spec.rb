require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  describe "validations" do
    it "is valid with valid attributes in a park" do
      resort = Resort.create!(name: "Walt Disney World Resort")
      park = Park.create!(name: "Magic Kingdom", resort: resort)
      restaurant = Restaurant.new(name: "Cinderella's Royal Table", locatable: park)
      expect(restaurant).to be_valid
    end

    it "is valid with valid attributes in a resort hotel" do
      resort = Resort.create!(name: "Walt Disney World Resort")
      hotel = ResortHotel.create!(name: "Grand Floridian", resort: resort)
      restaurant = Restaurant.new(name: "Citricos", locatable: hotel)
      expect(restaurant).to be_valid
    end

    it "is not valid without a name" do
      resort = Resort.create!(name: "Walt Disney World Resort")
      park = Park.create!(name: "Magic Kingdom", resort: resort)
      restaurant = Restaurant.new(name: nil, locatable: park)
      expect(restaurant).to_not be_valid
    end

    it "is not valid without a locatable" do
      restaurant = Restaurant.new(name: "Test Restaurant")
      expect(restaurant).to_not be_valid
    end
  end

  describe "associations" do
    it { should belong_to(:locatable) }
  end
end
