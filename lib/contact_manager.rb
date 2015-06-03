module ContactManager
	class WContact
		attr_accessor :account, :first_name, :last_name, :email, :phone_numbers, :address, :employer,
									:assignemnts, :social_accounts, :contact_form_data, :source, :created_date, :tags
		def initialize
			# contact class
			@account = nil
			@first_name = nil
			@last_name = nil
			@email = {
				:email_address => nil,
				:opt_out => 0
			}
			@phone_numbers = {
				:mobile => nil,
				:business => nil,
				:home => nil
			}
			@address = {
				:street => nil,
				:unit => nil,
				:city => nil,
				:zip => nil,
				:state => nil,
				:country => nil
			}
			@employer = {
				:name => nil,
				:title => nil, 
				:department => nil
			}
			@assignments = {
				:assigned => false,
				:members => []
			}
			@social_accounts = {
				:facebook => nil,
				:twitter => nil
			}
			@contact_form_data = {} # "free" fields, we let them put what they want in, within reason
			@source = nil
			#@created_date = nil
			@tags = []
		end # end constructor
			
		def addContact(api_key)
			# serialize this contact into JSON and hit the API with a new contact req
			API.new.addContact(self, api_key)
		end # end addContact method
	end # end contact class
	
	
	class API
		# api integration methods etc
		def initialize
			@base = "http://localhost:3000/api/v1"
		end # end constructor
		
		def addContact(contact, api_key)
			# add the contact to the remote api
			url = "#{@base}/contacts/new"
			uri = URI(url);

			http = Net::HTTP.new(uri.host, uri.port)

			request = Net::HTTP::Post.new(uri.path, {'Content-Type' =>'application/json'})
			request.body = {
				:api_token => api_key,
				:contact => contact
			}.to_json
			response = http.request(request)
			puts response.body
			
			
		end # end addcontact method	
	end # end class API


end # end contactmanager module










