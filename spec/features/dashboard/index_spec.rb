require 'rails_helper'

RSpec.describe "User Dashboard", type: :feature do
  before :each do
    @user = User.create!(
      first_name: "TestFirstName",
      last_name: "TestLastName",
      email: "test@example.com",
      password: "password",
      password_confirmation: "password"
    )
    visit root_path
    click_link "Log in"
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    click_button "Sign in"
  end
  describe "The dashboard page" do
    it 'loads at /dashboard' do
      expect(current_path).to eq(dashboard_index_path)
    end
    it "displays the user's name" do
      expect(page).to have_content("Bibbidi Bobbidi Boo! Have a magical day #{@user.first_name}!")
    end
  end
end
