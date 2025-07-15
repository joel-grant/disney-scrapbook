class Restaurant < ApplicationRecord
  belongs_to :locatable, polymorphic: true

  validates :name, presence: true
  validates :locatable, presence: true
end
