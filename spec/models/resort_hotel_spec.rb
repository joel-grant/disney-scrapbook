require 'rails_helper'

RSpec.describe ResortHotel, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      resort = Resort.create!(name: "Walt Disney World Resort")
      resort_hotel = ResortHotel.new(name: "Disney's Grand Floridian Resort & Spa", resort: resort)
      expect(resort_hotel).to be_valid
    end

    it "is not valid without a name" do
      resort = Resort.create!(name: "Walt Disney World Resort")
      resort_hotel = ResortHotel.new(name: nil, resort: resort)
      expect(resort_hotel).to_not be_valid
    end

    it "is not valid without a resort" do
      resort_hotel = ResortHotel.new(name: "Disney's Grand Floridian Resort & Spa")
      expect(resort_hotel).to_not be_valid
    end
  end

  describe "associations" do
    it { should belong_to(:resort) }
    it { should have_many(:restaurants) }
  end
end
