class RoomsController < ApplicationController
	before_action :set_room, only: [:show]

	def index
	end

	def new
		@room = Room.new
	end

	def show
	end

	def create
		@room = Room.new room_params
		@room.created_by = current_user.id

		if @room.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	private

	def set_room
		@room = Room.find(params[:id])
		@created_by = User.find(@room.created_by)

		winner = @room.winner
		if winner != nil && winner > 0
			@winner = User.find(winner)
		end
	end

	def room_params
		params.require(:room).permit(:prize_id, :start_date, :end_date, :created_by)
	end
end