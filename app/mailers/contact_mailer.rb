class ContactMailer < ApplicationMailer
	default from: "wreetco Form website@wreet.co";

	def contact_email_wreetco(inquiry)
		@inquiry = inquiry;
		mail(:to => "chase@wreet.co", :subject => "New inquiry from: #{@inquiry[:first_name]}");
	end; # end contact email

	def contact_email_client(inquiry)
		@inquiry = inquiry;
		mail(:to => @inquiry[:email], :subject => "Thanks for contacting wreetco");
	end;


end
