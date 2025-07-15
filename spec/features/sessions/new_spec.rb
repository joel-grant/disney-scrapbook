require 'rails_helper'

RSpec.describe "User Sessions", type: :feature do
  before :each do
    visit root_path
  end

  it "displays the login form" do
    expect(page).to have_content("Log in")
  end

  it "navigates a user from the dashboard to the login screen" do
    click_link("Log in")
    expect(current_path).to eq(login_path)
  end

  it "has a login screen with a login form" do
    click_link("Log in")

    expect(current_path).to eq(login_path)
    # expect(page).to have_selector("form#new_user")
    expect(page).to have_field("Email")
    expect(page).to have_field("Password")
    expect(page).to have_button("Sign in")
  end

  it 'redirects to the dashboard after successful login' do
    user = User.create!(
      first_name: "TestFirstName",
      last_name: "TestLastName",
      email: "test@example.com",
      password: "password"
    )

    visit root_path
    click_link "Log in"
    expect(current_path).to eq(login_path)

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"

    expect(current_path).to eq(dashboard_index_path)
    # expect(page).to have_content("Welcome back, #{user.first_name}!")
  end
end
