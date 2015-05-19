# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
	def wreetco_email_preview
		inquiry = {
			first_name: "Chase",
			last_name: "Higgins",
			email: "chase@wreet.co",
			subject: "Web Development",
			submitted: Time.now.to_formatted_s(:long),
			message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ac molestie enim, ut commodo magna. Sed non condimentum augue. Nunc maximus egestas bibendum. Aliquam facilisis ullamcorper ullamcorper. Pellentesque lacus quam, dictum sit amet convallis ut, commodo at massa. Vestibulum tempus risus non finibus bibendum. Vestibulum laoreet augue tellus, sit amet bibendum lorem mattis a. Quisque imperdiet laoreet erat sit amet faucibus."
		}
		ContactMailer.contact_email_wreetco(inquiry);
	end; 
	
	def client_email_preview
		inquiry = {
			first_name: "Timothy",
			last_name: "McClient",
			email: "client@customer.co.uk",
			subject: "Web Development",
			submitted: Time.now.to_formatted_s(:long),
			message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ac molestie enim, ut commodo magna. Sed non condimentum augue. Nunc maximus egestas bibendum. Aliquam facilisis ullamcorper ullamcorper. Pellentesque lacus quam, dictum sit amet convallis ut, commodo at massa. Vestibulum tempus risus non finibus bibendum. Vestibulum laoreet augue tellus, sit amet bibendum lorem mattis a. Quisque imperdiet laoreet erat sit amet faucibus."
		}
		ContactMailer.contact_email_client(inquiry);
	end
end
