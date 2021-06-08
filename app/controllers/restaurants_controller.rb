class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update]

  def index
    @restaurants = Restaurant.all

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
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
