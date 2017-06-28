module CategoriesHelper
	def category_badge(category, label = category.name)
		link_to(category_badge_content(label), category).html_safe
	end
	def category_badge_content(label)
		raw "<span class='badge'>#{label}</span>"
	end
end