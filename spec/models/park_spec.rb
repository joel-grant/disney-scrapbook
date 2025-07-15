require 'rails_helper'

RSpec.describe Park, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      resort = Resort.create!(name: "Walt Disney World Resort")
      park = Park.new(name: "Magic Kingdom", resort: resort)
      expect(park).to be_valid
    end

    it "is not valid without a name" do
      resort = Resort.create!(name: "Walt Disney World Resort")
      park = Park.new(name: nil, resort: resort)
      expect(park).to_not be_valid
    end

    it "is not valid without a resort" do
      park = Park.new(name: "Magic Kingdom")
      expect(park).to_not be_valid
    end
  end

  describe "associations" do
    it { should belong_to(:resort) }
    it { should have_many(:attractions) }
    it { should have_many(:restaurants) }
    it { should have_many(:shows) }
    it { should have_many(:characters) }
    it { should have_many(:events) }
  end
end
