class ContactController < ApplicationController
	protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json'}
	skip_before_action :verify_authenticity_token, if: Proc.new { |c| c.request.format == 'application/json'}
	
  def index
  end;
	
	def create
		# save the contact
		@contact = Contact.new(contact_params);
		@contact.save;
		# send the emails
		ContactMailer.contact_email_wreetco(params[:contact]).deliver_now;
		ContactMailer.contact_email_client(params[:contact]).deliver_now;
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
