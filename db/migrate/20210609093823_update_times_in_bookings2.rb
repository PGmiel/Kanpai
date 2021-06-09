class UpdateTimesInBookings2 < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :starts_at, :datetime
    add_column :bookings, :datetime, :datetime
    remove_column :bookings, :ends_at, :datetime
    add_column :bookings, :starts_at, :time
    add_column :bookings, :ends_at, :time
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
