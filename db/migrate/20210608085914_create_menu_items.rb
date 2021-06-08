class CreateMenuItems < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_items do |t|
      t.string :item_name
      t.integer :price
      t.string :category
      t.references :menu, null: false, foreign_key: true
      t.timestamps
    end
  end
end
