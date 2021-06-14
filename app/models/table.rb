class Table < ApplicationRecord
  belongs_to :restaurant
  has_many :bookings
  has_many :orders
  validates :status, confirmation: { case_sensitive: false }

  validates :status, inclusion: { in: %w(booked available),
    message: "%{value} is not a valid status" }

  def check_if_booking
    @table = self
    @table_bookings = @table.bookings
    @check_booking = @table_bookings.detect do |table_booking|
      (table_booking.starts_at > DateTime.now) &&
      (table_booking.starts_at < DateTime.now.advance(minutes: 30))
    end
    @check_booking
  end
end
