class UpdateTimesInBookings4 < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :starts_at
    add_column :bookings, :starts_at, :datetime
    remove_column :bookings, :ends_at
    add_column :bookings, :ends_at, :datetime
  end
end
