class ContactController < ApplicationController
  def index
  end
	
	def create
		# save the contact
		@contact = Contact.new(contact_params);
		#@contact.save;
		# send the emails
		ContactMailer.contact_email_wreetco(params[:contact]).deliver_now;
	end
	
	def contact_params
		params.require(:contact).permit(:first_name, :last_name, :email, :subject, :message);	
	end;
end
