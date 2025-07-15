class ResortHotel < ApplicationRecord
  belongs_to :resort
  has_many :restaurants, as: :locatable, dependent: :destroy

  validates :name, presence: true
end
