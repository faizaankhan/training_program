class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.send_result.subject
  #
  def send_result(result)
    @result=result
    @greeting = "Hi"
    mail to: result.user.email, subject: "Account activation"
  end
end
