class HomeController < ApplicationController
	def index
		@all_rooms = Room.where('start_date <= ? AND end_date >= ?', DateTime.now, DateTime.now).order("RANDOM()").limit(3)

		if user_signed_in?
			@my_rooms = current_user.rooms.order("RANDOM()").limit(3).distinct
		end
	end
end