# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'rafal@grubykodzi.pl'
  layout 'mailer'
end
