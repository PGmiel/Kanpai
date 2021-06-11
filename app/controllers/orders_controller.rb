class OrdersController < ApplicationController
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

  def closing_table
    @order = Order.find(params[:order_id])
    @pending_orders = @order.order_items.select { |order_item| order_item.status == "sent" }
    @pending_orders.each { |pending_order| pending_order.update(status: "paid") }
    @table = Table.find(@order.table_id)
    @order.update(status: "paid")
    @order.table.update(status: "available")
    redirect_to thank_you_path
  end

  def create_order
    @table = Table.find(params[:table_id])
    @order = Order.create(table: @table, status: "pending")
    redirect_to order_path(@order)
  end
end
