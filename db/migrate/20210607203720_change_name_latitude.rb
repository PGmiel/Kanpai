class ChangeNameLatitude < ActiveRecord::Migration[6.0]
  def change
    remove_column :restaurants, :latitute
  end
end
