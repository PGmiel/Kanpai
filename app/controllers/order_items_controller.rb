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

  def update

    # if params[:query].present?
    #   @order_items.each do |order_item|
    #     order_item.update(status: "sent")
    #   end
    # end
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity, :menu_item_id, :status, :total_price)
  end
end
