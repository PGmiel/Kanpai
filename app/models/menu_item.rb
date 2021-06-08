class MenuItem < ApplicationRecord
  belongs_to :menu
  has_many :order_items
  has_many :order, through: :order_items
end
