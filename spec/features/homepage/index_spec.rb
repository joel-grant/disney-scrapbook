require 'rails_helper'

RSpec.describe "Homepage", type: :feature do
  before :each do
    visit root_path
  end

  it "displays the app name" do
    expect(page).to have_content("Disney Scrapbook")
  end

  it "displays the app's goal" do
    expect(page).to have_content("Capture the magic, cherish the memories, and keep the wonder of your Disney vacation alive forever.")
  end

  it "has a link to log in" do
    expect(page).to have_link("Log in")
  end

  it "has a link to register" do
    expect(page).to have_link("Register")
  end

  it "has a link to register in the desktop navigation that leads to /register" do
    within("header") do
      within(".hidden.lg\\:flex.lg\\:flex-1.lg\\:justify-end") do
        click_link("Register")
      end
    end
    expect(page).to have_current_path("/register")
  end

  it "has a link to register in the mobile menu that leads to /register" do
    # Open mobile menu first
    find("[data-mobile-menu-button]").click

    within("[data-mobile-menu]") do
      click_link("Register")
    end
    expect(page).to have_current_path("/register")
  end
end
