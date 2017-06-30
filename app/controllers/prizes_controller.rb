class PrizesController < ApplicationController
	load_and_authorize_resource

	def index
		@prizes = Prize.paginate(page: params[:page], per_page: 10)
	end

	def show
	end

	def new
		@prize = Prize.new
	end

	def edit
	end

	def create
		@prize = Prize.new prize_params

		if @prize.save
			redirect_to @prize
		else
			render 'new'
		end
	end

	def update
		if @prize.update prize_params
			redirect_to @prize
		else
			render 'edit'
		end
	end

	def destroy
		@prize.destroy
		redirect_to prizes_path
	end

	private

	def prize_params
		params.require(:prize).permit(:name, :description, :photo_path, :price)
	end
end