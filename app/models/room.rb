class Room < ApplicationRecord
	include SearchCop
	
	search_scope :search do
		attributes :start_date, :end_date, :share_price
		attributes prize_price: ["prize.price"]
	end

	has_one :user, foreign_key: 'winner'
	has_one :user, foreign_key: 'created_by'
	has_many :user_rooms
	has_many :users, through: :user_rooms
	belongs_to :prize
end
