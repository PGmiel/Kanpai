class RemovePriceFromMenuItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :menu_items, :price
    add_column :menu_items, :sku, :string
  end
end
