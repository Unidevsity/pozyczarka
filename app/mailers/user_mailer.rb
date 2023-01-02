class UserMailer < ApplicationMailer
  default from: "grubykodzi@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @greeting = "Hi"

    mail to: user.email
  end
end
