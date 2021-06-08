class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :status
      t.integer :total_price
      t.string :payment_choice
      t.references :table, null: false, foreign_key: true
      t.timestamps
    end
  end
end
