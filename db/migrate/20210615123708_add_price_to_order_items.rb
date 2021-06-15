class AddPriceToOrderItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :order_items, :total_price

    add_monetize :order_items, :price, currency: { present: false }
  end
end
