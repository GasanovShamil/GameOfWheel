class CategoriesController < ApplicationController
	before_action :set_category, only: [:show]

	def index
		@categories = Category.paginate(page: params[:page], per_page: 10).includes(:type)
	end

	def new
		@category = Category.new
	end

	def show
	end

	def create
		@category = Category.new category_params

		if @category.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	private

	def set_category
		@category = Category.find(params[:id])
	end

	def category_params
		params.require(:category).permit(:name)
	end
end