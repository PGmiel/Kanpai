class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update]

  def index
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
        info_window: render_to_string(partial: "info_window", locals: { restaurant: restaurant })
        # , image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')
     }
    end
  end

  def show
    @average_reviews = @restaurant.average_rating
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
