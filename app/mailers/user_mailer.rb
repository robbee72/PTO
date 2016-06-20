class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def request_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Your Request for Paid Time Off has been send to your supervisor.')
  end
end
