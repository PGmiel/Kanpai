class AddAttributesToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :website, :string
    add_column :restaurants, :phone_number, :string
    add_column :restaurants, :rating, :float
  end
end
