class ModesOfTransportation < ApplicationRecord
  validates :name, presence: true

  belongs_to :resort
end
