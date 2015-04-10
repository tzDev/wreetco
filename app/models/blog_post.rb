class BlogPost
  include Mongoid::Document
  field :title, type: String
  field :posted_date, type: DateTime
  field :body, type: String
  field :categories, type: Array
  field :author, type: Integer
end
