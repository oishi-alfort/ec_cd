class Cart < ApplicationRecord
	has_many :cart_items
	belongs_to :user, optional: true
	has_one :order
	has_many :order_items, through: :order
end
