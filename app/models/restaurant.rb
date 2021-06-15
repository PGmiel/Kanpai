class Restaurant < ApplicationRecord
  acts_as_favoritable #to be able to save raestaurant to favourites

  belongs_to :user
  has_many :tables
  has_many :bookings, through: :tables
  has_many :menus
  has_many :menu_items, through: :menus
  has_many :reviews
  # has_many_attached :photos

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
    p available_tables
    available_table = available_tables.detect do |table|
      booking = table.bookings.where(starts_at: starts_at..ends_at)
      p booking
      booking.empty?
    end
    p available_table
  end

  def number_of_tables_available
    x = 0
    self.tables.each do |table|
      if table.status != "booked"
        x += 1
      end
    end
    return x
  end

  def pourcentage_of_table_available
    (number_of_tables_available.to_f / tables.count) * 100
  end


  def available?
    number_of_tables_available != 0
  end

  def color
    if available?
      if pourcentage_of_table_available <= 40
        return "#EB8600"
      else
        return "#067D54"
      end
    end
    return "#C33200"
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
    if self.reviews == []
      return 0
    else
      self.reviews.each do |review|
        sum += review.rating
      end
      return sum.to_f/self.reviews.count
    end
  end
end

