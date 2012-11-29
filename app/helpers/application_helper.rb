module ApplicationHelper

	def current_user
		session[:user]
	end
	
	def online
		current_user.present?
	end

	def feature_on?
		true
	end

	def colorful_icon_class_from_index idx
		colorful_icons = ["pink", "green", "blue", "orange"]
		colorful_text = ["&#127891;", "&#128640;", "&#128240;", "&#128101;", ""]
		idx = idx % colorful_icons.length
		{ :class_name => colorful_icons[idx], :icon_text => colorful_text[idx] }
	end
end
