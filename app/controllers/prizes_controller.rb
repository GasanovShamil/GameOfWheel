class PrizesController < ApplicationController
	before_action :set_room, only: [:show]

	def index
	end

	def new
		@prize = Prize.new
	end

	def show
	end

	def create
		@prize = Prize.new room_params

		if @prize.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	private

	def set_room
		@prize = Prize.find(params[:id])
	end

	def prize_params
		params.require(:prize).permit()
	end
end