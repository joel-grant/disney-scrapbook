require 'rails_helper'

RSpec.describe Attraction, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      resort = Resort.create!(name: "Walt Disney World Resort")
      park = Park.create!(name: "Magic Kingdom", resort: resort)
      attraction = Attraction.new(name: "Space Mountain", park: park)
      expect(attraction).to be_valid
    end

    it "is not valid without a name" do
      resort = Resort.create!(name: "Walt Disney World Resort")
      park = Park.create!(name: "Magic Kingdom", resort: resort)
      attraction = Attraction.new(name: nil, park: park)
      expect(attraction).to_not be_valid
    end

    it "is not valid without a park" do
      attraction = Attraction.new(name: "Space Mountain")
      expect(attraction).to_not be_valid
    end
  end

  describe "associations" do
    it { should belong_to(:park) }
  end
end
