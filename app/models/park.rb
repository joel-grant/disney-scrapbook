class Park < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: :resort_id }

  belongs_to :resort

  has_many :attractions
  has_many :restaurants, as: :locatable, dependent: :destroy
  has_many :shows
  has_many :characters
  has_many :events
  has_many :modes_of_transportation
end
