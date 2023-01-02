# frozen_string_literal: true
require 'sidekiq-scheduler'
class TestJob < ApplicationJob

  def perform
    UserMailer.welcome(User.last).deliver
  end
end
