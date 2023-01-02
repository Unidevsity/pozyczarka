# frozen_string_literal: true

class ApplicationJob < ActiveJob::Base
  # sidekiq
  queue_as :default

  self.queue_adapter = :sidekiq

end
