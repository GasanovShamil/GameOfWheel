class Room < ApplicationRecord
	has_one :user, foreign_key: 'winner'
	has_one :user, foreign_key: 'created_by'
	has_many :users_rooms
	has_many :users, through: :users_rooms
end
