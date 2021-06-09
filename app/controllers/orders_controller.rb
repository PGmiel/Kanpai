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
end
