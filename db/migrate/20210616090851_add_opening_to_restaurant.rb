class AddOpeningToRestaurant < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :opening_time, :datetime
    add_column :restaurants, :closing_time, :datetime
  end
end
