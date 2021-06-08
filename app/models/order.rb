class Order < ApplicationRecord
  has_many :order_items
  has_many :menu_items, through: :order_items
  belongs_to :table

  validates :status, inclusion: { in: %w(pending paid),
    message: "%{value} is not a valid status" }
end
