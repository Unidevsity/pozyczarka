class RentalRequestMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.rental_request_mailer.ask.subject
  #
  def ask(owner, user, item)
    @email = user.email
    @item = item
    mail to: owner.email
  end
end
