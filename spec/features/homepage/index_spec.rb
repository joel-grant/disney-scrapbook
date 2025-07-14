require 'rails_helper'

RSpec.describe "Homepage", type: :feature do
  before :each do
    visit root_path
  end

  it "displays the app name" do
    expect(page).to have_content("Disney Scrapbook")
  end

  it "displays the app's goal" do
    expect(page).to have_content("Easily track the little details of your Disney trips, and save them forever!")
  end
end