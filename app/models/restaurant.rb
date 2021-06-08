class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :tables
  has_many :bookings, through: :tables
  has_many :menus

  def find_table(datetime, number_of_customers)
    available_tables = tables.where("capacity >= ?", number_of_customers).order(:capacity)
    available_table = available_tables.detect { |table| table.bookings.where(datetime: datetime).empty? }
  end
end
