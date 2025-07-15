require 'rails_helper'

RSpec.describe "Sessions", type: :feature do
  before(:each) do
    User.create!(
      first_name: "TestFirstName",
      last_name: "TestLastName",
      email: "user@example.com",
      password: "password",
      password_confirmation: "password"
    )

    visit root_path
    click_link "Log in" # Assuming you have a link to log in on the homepage or similar
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_button "Sign in"
  end

  describe "Clicking the Log out button" do
    before(:each) do
      expect(current_path).to eq(dashboard_index_path)
    end

    it "logs out the user" do
      expect(page).to have_link("Log out")
      click_link "Log out"
      expect(current_path).to eq(root_path)
      expect(page).to have_content("You have been logged out.")
    end

    it "doesn't allow access to the dashboard after logging out" do
      click_link "Log out"
      visit dashboard_index_path
      expect(current_path).to eq(login_path) # Should redirect to login page
    end

    it "does not show the Log out link after logging out" do
      click_link "Log out"
      expect(page).not_to have_link("Log out") # Ensure the log out link is no longer present
      expect(page).to have_link("Log in")
    end
  end
end
