# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# User.create!(
#   first_name: "Admin",
#   last_name: "User",
#   email: "admin@example.com",
#   password: "crazy_password",
#   password_confirmation: "crazy_password"
# )

Park.create!(
  name: "Magic Kingdom",
  location: "Walt Disney World"
)
Park.create!(
  name: "EPCOT",
  location: "Walt Disney World"
)
Park.create!(
  name: "Disney's Hollywood Studios",
  location: "Walt Disney World"
)
Park.create!(
  name: "Disney's Animal Kingdom",
  location: "Walt Disney World"
)

Park.create!(
  name: "Disneyland Park",
  location: "Disneyland Resort"
)
Park.create!(
  name: "Disney California Adventure Park",
  location: "Disneyland Resort"
)

Park.create!(
  name: "Tokyo Disneyland",
  location: "Tokyo Disney Resort"
)
Park.create!(
  name: "Tokyo DisneySea",
  location: "Tokyo Disney Resort"
)
Park.create!(
  name: "Hong Kong Disneyland",
  location: "Hong Kong Disneyland Resort"
)
Park.create!(
  name: "Shanghai Disneyland",
  location: "Shanghai Disney Resort"
)
Park.create!(
  name: "Disneyland Paris",
  location: "Disneyland Paris"
)
Park.create!(
  name: "Walt Disney Studios Park",
  location: "Disneyland Paris"
)
Park.create!(
  name: "Disney's Typhoon Lagoon",
  location: "Walt Disney World"
)
Park.create!(
  name: "Disney's Blizzard Beach",
  location: "Walt Disney World"
)
Park.create!(
  name: "Aulani, A Disney Resort & Spa",
  location: "Ko Olina, Hawaii"
)
Park.create!(
  name: "Disney's Vero Beach Resort",
  location: "Vero Beach, Florida"
)
