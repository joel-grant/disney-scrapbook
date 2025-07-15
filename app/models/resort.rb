class Resort < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :location, presence: true

  has_many :parks
  has_many :resort_hotels
  has_many :modes_of_transportation
end
