require 'rails_helper'

RSpec.describe "User Registration", type: :feature do
  scenario "User registers with valid information" do
    visit new_user_registration_path

    fill_in "Email", with: "test@example.com"
    fill_in "First Name", with: "TestFirstName"
    fill_in "Last Name", with: "TestLastName"
    fill_in "Password", with: "password"
    fill_in "Password Confirmation", with: "password"
    click_button "Sign up"

    expect(current_path).to eq(dashboard_index_path) # Assuming you have a dashboard path after registration
    # expect(page).to have_content("Welcome! Be our Guest!")
    expect(page).to have_content("TestFirstName's Dashboard")
  end
end
