class Booking < ApplicationRecord
  belongs_to :table
  belongs_to :user
  validates :status, confirmation: { case_sensitive: false }
  validate :check_range

  # (Endbooking.s <= StartB or StartA >= EndB)

  def check_range
    @bookings = Booking.all
    @bookings.each do |booking|
      unless (booking.ends_at <= starts_at) || (booking.starts_at >= ends_at)
        errors.add(:starts_at, "Sorry, that time slot is taken")
      end
    end
  end
end
