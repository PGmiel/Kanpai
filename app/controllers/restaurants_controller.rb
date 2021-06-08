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
  end

  def show
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
