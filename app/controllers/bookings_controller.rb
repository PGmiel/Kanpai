class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @tables = Table.all
  end

  def create
    @booking = Booking.new(booking_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @booking.restaurant = @restaurant
    @booking.user = current_user
    redirect to root_path
  end

  private

  def booking_params
    params.require(:booking).permit(:datetime, :number_of_customers)
  end
end
