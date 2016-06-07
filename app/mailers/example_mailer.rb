class ExampleMailer < ApplicationMailer
  class ExampleMailer < ActionMailer::Base
    default from: "from@example.com"

    def sample_email(user)
      @user = user
      mail(to: @user.email, subject: 'Sample Email')
      mg_client = Heroku::Client.new ENV['api_key']
      message_params = {:from    => ENV['gmail_username'],
                        :to      => @user.email,
                        :subject => 'Sample Mail using Heroku API',
                        :text    => 'This mail is sent using Heroku API via Heroku-ruby'}
      mg_client.send_message ENV['domain'], message_params
    end  
end
