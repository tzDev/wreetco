module Slack
	class SlackMessage
		def initialize
			@webhook_url = "https://hooks.slack.com/services/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"
			@payload_template = {
				:text => "A new contact has been added to WCM.",
				:username => "wreetco website",
				:channel => "#general"
			}
		end # end constructor
		
		def sendMessage
			uri = URI(@webhook_url);
			http = Net::HTTP.new(uri.host, uri.port)
			http.use_ssl = true
			request = Net::HTTP::Post.new(uri.path, {'Content-Type' =>'application/json'})
			request.body = JSON.dump(@payload_template)
			response = http.request(request)
			puts response.body
		end # end sendMessage class
	end # end slack class
	
end # end Slack module