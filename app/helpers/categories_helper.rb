module CategoriesHelper
	def category_badge(category, label = category.name)
		raw '<span class="badge">' + label + '</span>'
	end
end