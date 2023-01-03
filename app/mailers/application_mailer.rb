# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'rafal@piekara.me'
  layout 'mailer'
end
