class Prize < ApplicationRecord
	has_many :rooms
	has_many :prize_categories
	has_many :categories, through: :prize_categories
end
