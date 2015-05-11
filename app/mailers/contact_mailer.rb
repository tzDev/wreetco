class ContactMailer < ApplicationMailer
	default from: "<Contact Form> website@wreet.co";

	def contact_email(inquiry)
		@inquiry = inquiry;
		mail(to: "chase@wreet.co", subject: "New inquiry from: #{inquiry[:inquirer]}");
	end; # end contact email


end
