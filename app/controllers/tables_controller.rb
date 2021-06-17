class TablesController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @table = Table.find(params[:id])
    @order = @table.orders.find_by(status: "pending")
    @bookings = Booking.all
    @table_bookings = @bookings.where(table_id: @table)

    if @table.status == "available" && @table.check_if_booking.present?
      redirect_to validate_user_path(@table)
    elsif @order
      redirect_to order_path(@order)
    else
      @order = Order.create(table: @table, status: "pending")
      @table.update(status: "booked")
      redirect_to order_path(@order)
    end
  end

  def validate_user
    @table = Table.find(params[:table_id])
    @user = user_booking.first.full_name
  end

  def user_booking
    @table_bookings = @table.bookings.where(status: "booked")
    @bookings = @table_bookings.select do |table_booking|
      (table_booking.starts_at > DateTime.now) &&
      (table_booking.starts_at < DateTime.now.advance(minutes: 30))
    end
    @bookings.map { |booking| booking.user }
  end
end
