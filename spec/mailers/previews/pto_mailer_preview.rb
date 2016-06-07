class PtoMailerPreview < ActionMailer::Preview
  def sample_mail_preview
    PtoMailer.sample_email(Employee.first)
  end
end
