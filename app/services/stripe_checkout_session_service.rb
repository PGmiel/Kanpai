class StripeCheckoutSessionService
  def call(event)
    @order = Order.find_by(checkout_session_id: event.data.object.id)
    @pending_orders = @order.order_items.select { |order_item| order_item.status == "sent" }
    @pending_orders.each { |pending_order| pending_order.update(status: "paid") }
    @order.update(status: "paid")
    @order.table.update(status: "available")
  end
end
