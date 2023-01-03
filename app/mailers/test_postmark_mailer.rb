# frozen_string_literal: true
require 'postmark-rails/templated_mailer'
class TestPostmarkMailer < PostmarkRails::TemplatedMailer

  def send_email
    self.template_model = {
      user_email: User.last.email
    }

    mail to: 'rafal@piekara.me', from: 'rafal@piekara.me', postmark_template_alias: 'pozyczarka'
  end
end
