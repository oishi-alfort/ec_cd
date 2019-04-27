class CartItem < ApplicationRecord
	belongs_to :cd
	belongs_to :user
	belongs_to :cart
end
