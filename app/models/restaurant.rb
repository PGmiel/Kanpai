class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :tables
  has_many :menus

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
