class TablesController < ApplicationController
  def show
    @table = Table.find(params[:id])
    @order = @table.orders.find_by(status: "pending")
    if @order
      redirect_to order_path(@order)
    else
      @order = Order.create(table: @table, status: "pending")
      @table.status = "booked"
      @table.save
      redirect_to order_path(@order)
    end
  end
end
