class OrdersController < ApplicationController
  skip_before_action :authenticate_user!

  def update
    @order = Order.find(params[:order_id])
  end

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.all
    @order_item = OrderItem.new
    @table = Table.find(@order.table_id)
    @restaurant = Restaurant.find(@table.restaurant_id)
    @starters = @restaurant.starters
    @main_dishes = @restaurant.main_dishes
    @desserts = @restaurant.desserts
    @hot_drinks = @restaurant.hot_drinks
    @beers = @restaurant.beers
    @wines = @restaurant.wines
  end

  def create_order
    @table = Table.find(params[:table_id])
    @order = Order.create(table: @table, status: "pending")
    @table.update(status: "booked")
    current_booking = @table.check_if_booking
    current_booking.update(status: "done") if current_booking.present?
    redirect_to order_path(@order)
  end
end
