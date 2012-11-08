class TestMailer < ActionMailer::Base
  # Doesn't seem to help:
  helper Haml::Helpers

  def mail_with_haml_in_decorator(user)
    @user = user
    mail to: 'test@example.com'
  end
end
