# frozen_string_literal: true

class ItemsReminderJob < ApplicationJob

  def perform
    items = Item.where("borrowed_at > ?", 5.days.ago)
    items.find_each do |item|
      owner = item.user
      borrowed_to = User.find(item.borrowed_to_id)
      ItemsMailer.reminder(item, owner.email, borrowed_to).deliver_later
    end
  end
end
