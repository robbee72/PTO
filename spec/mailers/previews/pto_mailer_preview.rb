class PtoMailerPreview < ActionMailer::Preview
  def sample_mail_preview
    PtoMailer.sample_email(User.first)
  end
end
