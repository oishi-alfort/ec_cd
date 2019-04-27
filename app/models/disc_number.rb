class DiscNumber < ApplicationRecord
	belongs_to :cd
	has_many :songs, dependent: :destroy, inverse_of: :disc_number
	accepts_nested_attributes_for :songs, reject_if: :all_blank, allow_destroy: true

end
