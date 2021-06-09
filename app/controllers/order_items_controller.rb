class OrderItemsController < ApplicationController
  def create
    @order = Order.find(params[:order_id])
    @menu_item = MenuItem.find(params[:order_item][:menu_item_id])
    @quantity = params[:order_item][:quantity]
    @order_item = OrderItem.new(order_item_params)
    @order_item.order = @order
    if @order_item.save!
      redirect_to order_path(@order)
    else
      flash[:notice] = "Order Item not"
      redirect_to order_path(@order)
    end
  end


  private

  def order_item_params
    params.require(:order_item).permit(:quantity, :menu_item_id)
  end
end
