class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @table = Table.find(@order.table_id)
  end
end
