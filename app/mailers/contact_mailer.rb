class ContactMailer < ApplicationMailer
	default from: "<Contact Form> website@wreet.co";

	def contact_email(inquiry)
		@inquiry = inquiry;
		puts "inquiry";
		puts @inquiry;
		mail(:to => "chase@wreet.co", :subject => "New inquiry from: #{@inquiry[:first_name]}");
	end; # end contact email


end
