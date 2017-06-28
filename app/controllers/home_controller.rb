class HomeController < ApplicationController
	before_action :authenticate_user!, only: [:index]	
	def index
		@all_rooms = Room.order("RANDOM()").limit(3)
		@my_rooms = Room.order("RANDOM()").limit(3)
	end
end