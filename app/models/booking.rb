class Booking < ApplicationRecord
  belongs_to :table
  belongs_to :user
  validates :status, confirmation: { case_sensitive: false }
  validate :check_range
  validates :ends_at, presence: true
  validates :starts_at, presence: true

  # (Endbooking.s <= StartB or StartA >= EndB)

  def check_range
    @bookings = self.table.restaurant.tables.each do |table|
      table.bookings.each do |booking|
        unless (booking.ends_at <= starts_at) || (booking.starts_at >= ends_at)
          errors.add(:starts_at, "Sorry, that time slot is taken")
          errors.add(:ends_at, "Take a later Spot after #{self.ends_at}")
        end
      end
    end
  end
end