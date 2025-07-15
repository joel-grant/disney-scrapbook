require 'rails_helper'

RSpec.describe "Park", type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      park = Park.new(name: "Magic Kingdom", location: "Walt Disney World")
      expect(park).to be_valid
    end

    it "is not valid without a name" do
      park = Park.new(name: nil, location: "Walt Disney World")
      expect(park).to_not be_valid
    end

    it "is not valid without a location" do
      park = Park.new(name: "Magic Kingdom", location: nil)
      expect(park).to_not be_valid
    end
  end

  describe "associations" do
    it { should have_many(:attractions) }
    it { should have_many(:restaurants) }
    it { should have_many(:shows) }
    it { should have_many(:characters) }
    it { should have_many(:events) }
    it { should have_many(:modes_of_transportation) }
  end
end