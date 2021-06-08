class Table < ApplicationRecord
  belongs_to :restaurant
  has_many :bookings
  has_many :orders
end
