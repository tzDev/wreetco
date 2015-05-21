class BlogPost
  include Mongoid::Document
  field :title, type: String
  field :posted_date, type: DateTime
  field :author, type: String
  field :body, type: String
  field :tags, type: Array
  field :project, type: Integer
  field :published, type: Boolean
	field :views, type: Integer

	
end
