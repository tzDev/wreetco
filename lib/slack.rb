module Slack
	class SlackMessage
		def initialize
			@payload_template = {
				:text => "A new contact has been added to WCM.",
				:username => "wreetco website",
				:channel => "#general"
			}
		end # end constructor
		
		def sendMessage(slack_hook, first, last, subject)
			@payload_template[:text] += "Name: #{first} #{last} Interest: #{subject}";
			uri = URI(slack_hook);
			http = Net::HTTP.new(uri.host, uri.port)
			http.use_ssl = true
			request = Net::HTTP::Post.new(uri.path, {'Content-Type' =>'application/json'})
			request.body = JSON.dump(@payload_template)
			response = http.request(request)
		end # end sendMessage class
	end # end slack class
	
end # end Slack module