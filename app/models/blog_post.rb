class BlogPost
  include Mongoid::Document
	has_many :category

  field :title, type: String
  field :posted_date, type: DateTime
  field :body, type: String
  field :categories, type: Array
  field :author, type: Integer
	
	belongs_to :project;
end
