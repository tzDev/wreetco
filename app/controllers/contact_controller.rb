class ContactController < ApplicationController
  def index
  end
	
	def create
		ContactMailer.contact_email(params[:contact]).deliver_now;
	end
end
