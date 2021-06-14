class AddPriceToMenuItems < ActiveRecord::Migration[6.0]
  def change
    add_monetize :menu_items, :price, currency: { present: false }
  end
end
