require 'rails_helper'
RSpec.describe Show, type: :model do
  describe "validations" do
    it "is valid with valid attributes in a park" do
      resort = Resort.create!(name: "Walt Disney World Resort")
      park = resort.parks.create!(name: "Magic Kingdom")
      show = park.shows.new(name: "Happily Ever After")
      expect(show).to be_valid
    end

    it "is not valid without a name" do
      resort = Resort.create!(name: "Walt Disney World Resort")
      park = resort.parks.create!(name: "Magic Kingdom")
      show = park.shows.new(name: nil)
      expect(show).to_not be_valid
    end

    it "is not valid without a locatable" do
      show = Show.new(name: "Test Show")
      expect(show).to_not be_valid
    end
  end

  describe "associations" do
    it { should belong_to(:park) }
  end
end
