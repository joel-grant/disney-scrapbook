require 'rails_helper'

RSpec.describe "Homepage", type: :feature do
  before :each do
    visit root_path
  end

  it "displays the app name" do
    expect(page).to have_content("Disney Scrapbook")
  end

  it "displays the app's goal" do
    expect(page).to have_content("Save even the finest details about your rides, meals and stops during your Disney Vacation!")
  end

  it "has a link to log in" do
    expect(page).to have_link("Log in")
  end

  it "has a link to get started" do
    expect(page).to have_link("Get started")
  end
end
