# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Oceny::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.mandrillapp.com',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['MANDRILL_USERNAME'],
  :password       => ENV['MANDRILL_APIKEY'],
  :domain         => 'heroku.com',
  :enable_starttls_auto => true
}
