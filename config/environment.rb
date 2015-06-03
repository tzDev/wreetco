# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

# senselessly organize the date into a random format
Time::DATE_FORMATS[:us_date] = "%a. %b %e, %Y"

ActionMailer::Base.smtp_settings = {
  :user_name => ENV['SG_USER'],
  :password => ENV['SG_PASS'],
  :domain => 'wreet.co',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}

WCM_API = ENV['WCM_API']
SLACK_WEBHOOK = ENV['SLACK_HOOK']
