class Attraction < ApplicationRecord
  validates :name, presence: true

  belongs_to :park
end
