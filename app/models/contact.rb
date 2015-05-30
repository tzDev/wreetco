class Contact
  include Mongoid::Document
	field :first_name, type: String
	field :last_name, type: String
	field :email, type: String
	field :created_date, :type => DateTime, default: ->{ Date.today }
	field :subject, type: String
	field :message, type: String
	field :wcm, :type => Hash, :default => {:assigned => false}	
end
