class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :tables
  has_many :bookings, through: :tables
  has_many :menus
  has_many :menu_items, through: :menus

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
end
