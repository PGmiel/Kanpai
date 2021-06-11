class TablesController < ApplicationController
  skip_before_action :authenticate_user!
  def show
    @table = Table.find(params[:id])
    @order = @table.orders.find_by(status: "pending")
    @bookings = Booking.all
    @table_bookings = @bookings.where(table_id: @table)

    if check_if_booking(@table.id)
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
    @check_user = user_booking(@table.id)
    @user = User.find(@check_user.first.user_id)
  end

  def check_if_booking(table_id)
    @table = Table.find(table_id)
    @table_bookings = Booking.where(table_id: @table)
    @check_bookings = @table_bookings.select do |table_booking|
      (table_booking.starts_at > DateTime.now) &&
      (table_booking.starts_at < DateTime.now.advance(minutes: 30))
    end
    @check_bookings.present?
  end

  def user_booking(table_id)
    @table = Table.find(table_id)
    @table_bookings = Booking.where(table_id: @table)
    @bookings = @table_bookings.select do |table_booking|
      (table_booking.starts_at > DateTime.now) &&
      (table_booking.starts_at < DateTime.now.advance(minutes: 30))
    end
    @bookings
  end
end
