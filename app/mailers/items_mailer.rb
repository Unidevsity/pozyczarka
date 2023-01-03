class ItemsMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.items_mailer.reminder.subject
  #
  def reminder(item, email, borrowed_to)
    @item = item
    @borrowed_to = borrowed_to

    mail to: email
  end
end
