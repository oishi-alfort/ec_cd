class CartItem < ApplicationRecord
	belongs_to :cd, optional: true
	belongs_to :cart, optional: true
end
