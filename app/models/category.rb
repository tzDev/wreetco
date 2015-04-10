class Category
  include Mongoid::Document
  field :name, type: String
	store_in collection: 'categories'

end
