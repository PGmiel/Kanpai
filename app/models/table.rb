class Table < ApplicationRecord
  belongs_to :restaurant
  has_many :bookings
  has_many :orders

  validates :status, inclusion: { in: %w(booked available),
    message: "%{value} is not a valid status" }
end
