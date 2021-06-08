class CreateTables < ActiveRecord::Migration[6.0]
  def change
    create_table :tables do |t|
      t.integer :number_of_table
      t.integer :capacity
      t.string :status
      t.references :restaurant, null: false, foreign_key: true
      t.timestamps
    end
  end
end
