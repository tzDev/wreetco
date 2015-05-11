class ProjectController < ApplicationController
  def index
  end
	
	def getProjects 
		@projects = Project.all;
		@projects.each() { |p|
			
		}
		respond_to do |format|
			format.json {render :json => @projects.to_json(:include => :blog_posts)}
		end
	end;
end
