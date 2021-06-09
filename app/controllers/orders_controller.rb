class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @table = Table.find(@order.table_id)
    @restaurant = Restaurant.find(@table.restaurant_id)
    @drinks_category = ["Hot Drinks", "Beers", "Wine"]
    @food_category = ["Starter", "Main Dishes", "Dessert"]
  end
end
