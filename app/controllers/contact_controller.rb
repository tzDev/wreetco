class ContactController < ApplicationController
	protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json'}
	skip_before_action :verify_authenticity_token, if: Proc.new { |c| c.request.format == 'application/json'}
	# wreetco contact manager
	include ContactManager
	include Slack
	
  def index
  end;
	
	def create
		# save the contact
		# local db, just in case
		@contact = Contact.new(contact_params);
		@contact.save;
		# now save it to the contact manager deal
		c = ContactManager::WContact.new
		c.first_name = params[:contact][:first_name]
		c.last_name = params[:contact][:last_name]
		c.contact_form_data = params[:contact]
		c.email = {:email_address => params[:contact][:email], :opt_out => 0}
		c.source = "Contact Form - wreet.co"
		c.addContact(WCM_API)
		# send the email messages
		#ContactMailer.contact_email_wreetco(params[:contact]).deliver_now;
		ContactMailer.contact_email_client(params[:contact]).deliver_now;
		# send an alert to slack
		begin
			Slack::SlackMessage.new.sendMessage(SLACK_WEBHOOK, params[:contact][:first_name], params[:contact][:last_name], params[:contact][:subject])
		rescue
			puts "[-] Could not post message to Slack."
		end
	end;

	# POST /get_contacts
	def get_contacts
		# get a list of contacts based on the params received in the get request
		if (params[:search_params][:assigned] == false)
			# return unassigned
			@contacts = Contact.where("this.wcm.assigned == false");
		elsif (params[:search_params][:assigned].is_a? String)
			@contacts = Contact.where("this.wcm.assigned == '" << params[:search_params][:assigned] << "'");
		end;
		
		
		respond_to do |format|
			format.json {render :json => @contacts }
		end
	end;

	
	def contact_params
		params.require(:contact).permit(:first_name, :last_name, :created_date, :email, :subject, :message);	
	end;
end;
