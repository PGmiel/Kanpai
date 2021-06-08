class RemoveStatusOwnerFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :status_owner, :string
  end
end
