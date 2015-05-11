class Project
  include Mongoid::Document
	
	has_many :blog_posts;
end
