require 'rails_helper'
RSpec.describe Event, type: :model do
  describe "validations" do
    it "is valid with valid attributes in a park" do
      resort = Resort.create!(name: "Walt Disney World Resort")
      park = resort.parks.create!(name: "Magic Kingdom")
      event = park.events.new(name: "Mickey's Not-So-Scary Halloween Party")
      expect(event).to be_valid
    end

    it "is not valid without a name" do
      resort = Resort.create!(name: "Walt Disney World Resort")
      park = resort.parks.create!(name: "Magic Kingdom")
      event = park.events.new(name: nil)
      expect(event).to_not be_valid
    end

    it "is not valid without a locatable" do
      event = Event.new(name: "Test Event")
      expect(event).to_not be_valid
    end
  end

  describe "associations" do
    it { should belong_to(:park) }
  end
end
