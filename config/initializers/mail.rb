ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['ascot21'],
  :password       => ENV['XAPKBEWkNo8yD7YQTZWt'],
  :domain         => 'heroku.com'
}
ActionMailer::Base.delivery_method = :smtp