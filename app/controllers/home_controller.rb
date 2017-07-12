class HomeController < ApplicationController
	def index
		@all_rooms = Room.where('start_date <= ? AND end_date >= ?', DateTime.now, DateTime.now).order("RANDOM()").limit(3)

		if user_signed_in?
			@dist = current_user.rooms.select("DISTINCT rooms.*")
			@my_rooms = @dist.order("RANDOM()").limit(3)
		end
	end
end
