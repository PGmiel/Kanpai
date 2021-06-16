class ChangeTableRestaurant < ActiveRecord::Migration[6.0]
  def change
    remove_column :restaurants, :opening_time
    remove_column :restaurants, :closing_time
  end
end
