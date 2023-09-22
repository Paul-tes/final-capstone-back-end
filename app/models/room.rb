class Room < ApplicationRecord
  has_many :reservations

  validates :location, presence: true
end
