class HomeController < ApplicationController
	before_action :authenticate_user!, only: [:index]	
	def index
		@all_rooms = Room.where('start_date <= ? AND end_date >= ?', DateTime.now, DateTime.now).order("RANDOM()").limit(3)

		@my_rooms = current_user.rooms.order("RANDOM()").limit(3).distinct
	end
end