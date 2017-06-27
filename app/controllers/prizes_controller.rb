class PrizesController < ApplicationController
	before_action :set_prize, only: [:show]

	def index
		@prizes = Prize.paginate(page: params[:page], per_page: 10).includes(:type)
	end

	def new
		@prize = Prize.new
	end

	def show
	end

	def create
		@prize = Prize.new prize_params

		if @prize.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	private

	def set_prize
		@prize = Prize.find(params[:id])
	end

	def prize_params
		params.require(:prize).permit(:name, :description, :photo_path, :price)
	end
end