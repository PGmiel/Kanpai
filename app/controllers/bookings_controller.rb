class BookingsController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    table = @restaurant.find_table(@booking.datetime, @booking.number_of_customers)
    @booking.table = table
    @booking.user = current_user
    @booking.status = "booked"
    @booking.save!
    redirect_to root_path
  end

  def update
  end

  def user_bookings
    @bookings = Booking.all
  end

  private

  def booking_params
    params.require(:booking).permit(:datetime, :number_of_customers, :status)
  end
end
