require 'rails_helper'

RSpec.describe "Resort", type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      resort = Resort.new(name: "Walt Disney World")
      expect(resort).to be_valid
    end

    it "is not valid without a name" do
      resort = Resort.new(name: nil)
      expect(resort).to_not be_valid
    end

    it "is not valid without a location" do
      resort = Resort.new(name: "Walt Disney World")
      expect(resort).to_not be_valid
    end
  end

  describe "associations" do
    it { should have_many(:parks) }
    it { should have_many(:resort_hotels) }
    it { should have_many(:modes_of_transportation) }
  end
end