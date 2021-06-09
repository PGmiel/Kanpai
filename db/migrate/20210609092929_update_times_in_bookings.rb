class UpdateTimesInBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :datetime
    add_column :bookings, :starts_at, :datetime
    add_column :bookings, :ends_at, :datetime
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
