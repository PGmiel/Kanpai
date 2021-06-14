class AddStripeToOrder < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :payment_choice

    add_column :orders, :checkout_session_id, :string
    add_monetize :orders, :amount, currency: { present: false }
  end
end
