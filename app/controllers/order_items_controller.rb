class OrderItemsController < ApplicationController
  def create
    @order = Order.find(params[:order_id])
    @menu_item = MenuItem.find(params[:order_item][:menu_item_id])
    @quantity = params[:order_item][:quantity]
    @order_item = OrderItem.new(order_item_params)
    @order_item.order = @order
    if @order_item.save!
      @order_item.update(status: "pending")
      @order_item.update(total_price: @order_item.quantity * @menu_item.price)
      redirect_to order_path(@order)
    else
      flash[:notice] = "Not available"
      redirect_to order_path(@order)
    end
  end

  def validate_order
    @order = Order.find(params[:order_id])
    @pending_orders = @order.order_items.select { |order_item| order_item.status == "pending" }
    @pending_orders.each { |pending_order| pending_order.update(status: "sent") }
    redirect_to order_path(@order)
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity, :menu_item_id, :status, :total_price)
  end
end
