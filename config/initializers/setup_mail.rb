ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              => 'smtp.sendgrid.net',
  :port                 => '587',
  :authentication       => :plain,
  :user_name            =>  'app52114736@heroku.com',
  :password             => '0qz6iixj5087',
  :domain               => 'heroku.com',
  :enable_startls_auto  =>  true             
}
