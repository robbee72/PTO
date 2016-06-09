class PtoMailer < ActionMailer::Base

  def sample_email(employee)
    @employee = employee
    mg_client = Heroku::Client.new ENV['api_key']
    message_params = {:from    => ENV['gmail_employeename'],
                      :to      => @employee.email,
                      :subject => 'Sample Mail using Heroku API',
                      :text    => 'This mail is sent using Heroku API via heroku-ruby'}
    mg_client.send_message ENV['domain'], message_params
  end
end
