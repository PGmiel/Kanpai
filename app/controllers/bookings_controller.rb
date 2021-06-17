class BookingsController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    starts_at = DateTime.parse(booking_params[:starts_at]).change(hour: booking_params[:ends_at].split(':').first.to_i, min: booking_params[:ends_at].split(':').last.to_i)
    ends_at = DateTime.parse(booking_params[:starts_at]).change(hour: booking_params[:ends_at].split(':').first.to_i + 2, min: booking_params[:ends_at].split(':').last.to_i)
    # "ends_at"=>"22:30", "starts_at"=>"2021-06-16"
    @booking = Booking.new
    @booking.starts_at = starts_at
    @booking.ends_at = ends_at
    @booking.duration = booking_params[:duration]
    @booking.number_of_customers = booking_params[:number_of_customers]
    @restaurant = Restaurant.find(params[:restaurant_id])
    table = @restaurant.find_table(@booking.starts_at, @booking.ends_at, @booking.number_of_customers)
    @booking.table = table
    @booking.user = current_user
    @booking.status = "booked"
    if @booking.save!
      flash[:notice] = "Booking Created!"
      CheckTableStatusJob.set(wait_until: @booking.starts_at).perform_later(table.id)
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
    params.require(:booking).permit(:ends_at, :starts_at, :duration, :number_of_customers, :status)
  end
end
