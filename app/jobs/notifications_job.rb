# frozen_string_literal: true

class NotificationsJob < ApplicationJob

  def perform(user_id, data)
    user = User.find(user_id)
    user.notifications.create(data: data)
  end
end
