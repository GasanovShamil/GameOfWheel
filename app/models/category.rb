class Category < ApplicationRecord
	has_many :prize_categories
	has_many :prizes, through: :prize_categories
end
