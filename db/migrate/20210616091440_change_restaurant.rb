class ChangeRestaurant < ActiveRecord::Migration[6.0]
  def change
    remove_column :restaurants, :opening_time
    remove_column :restaurants, :closing_time

    add_column :restaurants, :opening_time, :time
    add_column :restaurants, :closing_time, :time
  end
end
