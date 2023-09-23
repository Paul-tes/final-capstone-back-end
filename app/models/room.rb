class Room < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates :location, presence: true
  validates :price_per_day, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
