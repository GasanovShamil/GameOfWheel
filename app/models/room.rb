class Room < ApplicationRecord
	belongs_to :winner, :class_name => 'Users'
	belongs_to :created_by, :class_name => 'Users'
	has_many :users
	has_many :users_rooms
	has_many :users, through: :users_rooms
end
