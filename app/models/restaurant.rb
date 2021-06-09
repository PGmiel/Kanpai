class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :tables
  has_many :bookings, through: :tables
  has_many :menus
  has_many :menu_items, through: :menus
  has_many :reviews

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :general_search,
    against: [:name, :address],
    associated_against: {
      menu_items: [:category]
    },
    using: {
      tsearch: { prefix: true }
    }

  def find_table(starts_at, ends_at, number_of_customers)
    available_tables = tables.where("capacity >= ?", number_of_customers).order(:capacity)
    # available_table = available_tables.detect { |table| table.bookings.where(starts_at: starts_at, ends_at: ends_at).empty? }
    available_table = available_tables.detect { |table| table.bookings.where(created_at: starts_at..ends_at).empty? }
  end

  def starters
    self.menu_items.select do |menu_item|
      menu_item.category == "Starter"
    end
  end

  def main_dishes
    self.menu_items.select do |menu_item|
      menu_item.category == "Main Dishes"
    end
  end

  def desserts
    self.menu_items.select do |menu_item|
      menu_item.category == "Dessert"
    end
  end

  def hot_drinks
    self.menu_items.select do |menu_item|
      menu_item.category == "Hot Drinks"
    end
  end

  def beers
    self.menu_items.select do |menu_item|
      menu_item.category == "Beers"
    end
  end

  def wines
    self.menu_items.select do |menu_item|
      menu_item.category == "Wine"
    end
  end

  def average_rating
    # @average = Review.average_rating
    # @average = Review.average(:rating)
    sum = 0
    self.reviews.each do |review|
      sum += review.rating
    end
    return sum.to_f/self.reviews.count
  end
end
