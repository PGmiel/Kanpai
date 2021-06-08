class AddStatusToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :status_owner, :string
  end
end
