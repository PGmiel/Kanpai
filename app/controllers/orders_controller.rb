class OrdersController < ApplicationController
  skip_before_action :authenticate_user!

  def update
    @order =  Order.find(params[:order_id])
    #@order_finalized = @order.update!(: teddy, , amount: teddy.price, status: 'pending', table_id: @order.table_id)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: teddy.sku,
        images: [teddy.photo_url],
        amount: teddy.price_cents,
        currency: 'eur',
        quantity: 1
      }],
      success_url: order_url(order),
      cancel_url: order_url(order)
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.all
    @order_item = OrderItem.new
    @table = Table.find(@order.table_id)
    @restaurant = Restaurant.find(@table.restaurant_id)
    # @drinks_category = ["Hot Drinks", "Beers", "Wine"]
    # @food_category = ["Starter", "Main Dishes", "Dessert"]
    @starters = @restaurant.starters
    @main_dishes = @restaurant.main_dishes
    @desserts = @restaurant.desserts
    @hot_drinks = @restaurant.hot_drinks
    @beers = @restaurant.beers
    @wines = @restaurant.wines
  end

  # def closing_table
  #   # @order = Order.find(params[:order_id])
  #   # @pending_orders = @order.order_items.select { |order_item| order_item.status == "sent" }
  #   # @pending_orders.each { |pending_order| pending_order.update(status: "paid") }
  #   # @table = Table.find(@order.table_id)
  #   # @order.update(status: "paid")
  #   # @order.table.update(status: "available")
  #   # redirect_to thank_you_path
  # end

  def create_order
    @table = Table.find(params[:table_id])
    @order = Order.create(table: @table, status: "pending")
    @table.update(status: "booked")
    current_booking = @table.check_if_booking
    current_booking.update(status: "done") if current_booking.present?
    redirect_to order_path(@order)
  end
end
