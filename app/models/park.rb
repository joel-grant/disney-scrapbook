class Park < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :location, presence: true

  # has_many :attractions
  # has_many :restaurants
  # has_many :shows
  # has_many :characters
  # has_many :events
  # has_many :modes_of_transportation
end
