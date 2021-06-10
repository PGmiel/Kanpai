class TablesController < ApplicationController
  def show
    @table = Table.find(params[:id])
    @order = @table.orders.find_by(status: "pending")
    if @order
      redirect_to order_path(@order)
    else
      @order = Order.create(table: @table, status: "pending")
      @table.update(status: "booked")
      redirect_to order_path(@order)
    end
  end
end
