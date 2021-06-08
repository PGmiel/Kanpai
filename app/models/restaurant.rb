class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :tables
  has_many :menus
end
