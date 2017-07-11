class Prize < ApplicationRecord
	include SearchCop
	
	search_scope :search do
		attributes :name
		attributes category: ["categories.name"]
	end

	has_many :rooms
	has_many :prize_categories
	has_many :categories, through: :prize_categories
end
