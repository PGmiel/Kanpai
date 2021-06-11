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
    table = @restaurant.find_table(@booking.starts_at, @booking.ends_at, @booking.number_of_customers)
    @booking.table = table
    @booking.user = current_user
    @booking.status = "booked"
    if @booking.save
      # CheckTableStatusJob.set(wait_until: @booking.starts_at).perform_later(table.id)
      redirect_to restaurants_path
    else
      flash[:alert] = "Issue"
      redirect_to restaurants_path
    end
  end

  def update
  end

  def user_bookings
    @bookings = Booking.all
  end



  private

  def booking_params
    params.require(:booking).permit(:ends_at, :starts_at, :number_of_customers, :status)
  end
end
