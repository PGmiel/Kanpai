class UpdateOrderTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :amount_cents

    add_monetize :orders, :price, currency: { present: false }
  end
end
