class Author
  include Mongoid::Document
  field :name, type: String
  field :created_date, type: DateTime
end
