class Cd < ApplicationRecord
	has_many :favorites, dependent: :destroy
	belongs_to :artist
	belongs_to :label
	belongs_to :category
	has_many :favorites, dependent: :destroy
	accepts_nested_attributes_for :favorites
	has_many :comments, dependent: :destroy
	accepts_nested_attributes_for :comments
	has_many :comment_replies, through: :comments, dependent: :destroy
	attachment :cd_image
	has_one :pickup, inverse_of: :cd

	#ryo
	has_many :disc_numbers, dependent: :destroy, inverse_of: :cd
	accepts_nested_attributes_for :disc_numbers, reject_if: :all_blank, allow_destroy: true

	has_many :cart_items, dependent: :destroy
	has_many :order_items
	acts_as_paranoid




	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

end
