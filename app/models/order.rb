class Order < ApplicationRecord
	belongs_to :user, optional: true
	has_many :order_items, dependent: :destroy
	accepts_nested_attributes_for :order_items
	belongs_to :cart, optional: true
end
