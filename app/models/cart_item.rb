class CartItem < ApplicationRecord
	belongs_to :cd
	belongs_to :cart, optional: true
end
