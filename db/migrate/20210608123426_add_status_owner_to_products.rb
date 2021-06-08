class AddStatusOwnerToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :status_owner, :boolean, default: :false
  end
end
