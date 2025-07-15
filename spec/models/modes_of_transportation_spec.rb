require 'rails_helper'

RSpec.describe "ModesOfTransportation", type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      mode = ModesOfTransportation.new(name: "Monorail")
      expect(mode).to be_valid
    end

    it "is not valid without a name" do
      mode = ModesOfTransportation.new(name: nil)
      expect(mode).to_not be_valid
    end

    it "is not valid without a park_id" do
      mode = ModesOfTransportation.new(name: "Monorail")
      expect(mode).to_not be_valid
    end
  end

  describe "associations" do
    it { should belong_to(:resort) }
  end
end