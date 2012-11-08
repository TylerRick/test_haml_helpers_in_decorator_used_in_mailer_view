class TestController < ApplicationController
  def view_with_haml_in_decorator
    @user = User.new
    render file: 'test_mailer/mail_with_haml_in_decorator'
  end

  def mail_with_haml_in_decorator
    @user = User.new
    TestMailer.mail_with_haml_in_decorator(@user).deliver
  end
end
