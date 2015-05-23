class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	
	helper_method :top_posts
	
	# some helpers
	def top_posts
		BlogPost.order_by(:views.desc).limit(25).to_a;
	end
	
end
