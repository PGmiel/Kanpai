class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @time_slots = time_slots
    if params[:query].present?
      @restaurants = Restaurant.general_search(params[:query])
      # @restaurants = @restaurants.joins(:tables).where("tables.status = ?", "available")
    else
      @restaurants = Restaurant.all
    end
    @booking = Booking.new
    # the `geocoded` scope filters only restaurants with coordinates (latitude & longitude)
    @markers = @restaurants.geocoded.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude,
        color: restaurant.color,
        info_window: render_to_string(partial: "info_window", locals: { restaurant: restaurant })
        # , image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')
      }
    end
  end

  def time_slots
    times_array = []
    (10..23).each do |n|
    times_array << "#{n}:00"
    times_array << "#{n}:30"
    end
    return times_array
  end

  def show
    @bookings = Booking.all
    @starters = @restaurant.starters
    @main_dishes = @restaurant.main_dishes
    @desserts = @restaurant.desserts
    @hot_drinks = @restaurant.hot_drinks
    @beers = @restaurant.beers
    @wines = @restaurant.wines
    @time_slots = time_slots
    @booking = Booking.new
  end

  def favoritize
    @restaurant = Restaurant.find(params[:restaurant_id])
    if current_user.favorited?(@restaurant)
      current_user.unfavorite(@restaurant)
    else
      current_user.favorite(@restaurant)
    end
    redirect_to restaurants_path
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  # def restaurant_params
  #   params.require(:restaurant).permit(:name, :address, :website, :phone_number, :rating, :photo)
  # end
end
