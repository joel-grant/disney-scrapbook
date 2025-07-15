require 'rails_helper'

RSpec.describe ModesOfTransportation, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      resort = Resort.create!(name: "Walt Disney World Resort")
      mode = ModesOfTransportation.new(name: "Monorail", resort: resort)
      expect(mode).to be_valid
    end

    it "is not valid without a name" do
      resort = Resort.create!(name: "Walt Disney World Resort")
      mode = ModesOfTransportation.new(name: nil, resort: resort)
      expect(mode).to_not be_valid
    end

    it "is not valid without a resort" do
      mode = ModesOfTransportation.new(name: "Monorail")
      expect(mode).to_not be_valid
    end
  end

  describe "associations" do
    it { should belong_to(:resort) }
  end
end
