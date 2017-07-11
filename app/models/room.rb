class Room < ApplicationRecord
	

	has_one :user, foreign_key: 'winner'
	has_one :user, foreign_key: 'created_by'
	has_many :user_rooms
	has_many :users, through: :user_rooms
	belongs_to :prize
end
