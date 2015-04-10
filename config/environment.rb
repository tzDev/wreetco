# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

# senselessly organize the date into a random format
Time::DATE_FORMATS[:us_date] = "%a. %b %e, %Y"
