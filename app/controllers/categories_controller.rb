class CategoriesController < ApplicationController
	load_and_authorize_resource

	def index
		@categories = Category.paginate(page: params[:page], per_page: 10)
	end

	def show
	end

	def new
		@category = Category.new
	end

	def edit
	end

	def create
		@category = Category.new category_params

		if @category.save
			redirect_to @category
		else
			render 'new'
		end
	end

	def update
		if @category.update category_params
			redirect_to @category
		else
			render 'edit'
		end
	end

	def destroy
		@category.destroy
		redirect_to categories_path
	end

	private

	def category_params
		params.require(:category).permit(:name)
	end
end