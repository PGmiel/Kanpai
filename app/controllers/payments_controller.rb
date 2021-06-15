class PaymentsController < ApplicationController
  skip_before_action :authenticate_user!

  def new_payment
    @order = Order.find(params[:order_id])
    if @order.checkout_session_id.nil?
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: line_items,
        success_url: order_url(@order),
        cancel_url: order_url(@order)
      )
      @order.update(checkout_session_id: session.id)
    end
  end

  private

  def line_items
    @order.order_items.map do |order_item|
      {
        name: order_item.menu_item.item_name,
        price_cents: order_item.total_price,
        currency: 'eur',
        quantity: order_item.quantity
      }
    end
  end
end
