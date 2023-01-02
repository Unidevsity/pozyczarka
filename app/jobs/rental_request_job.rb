# frozen_string_literal: true

class RentalRequestJob < ApplicationJob

  def perform(owner_id, user_id, item_id)
    owner = User.find(owner_id)
    user = User.find(user_id)
    item = Item.find(item_id)

    RentalRequestMailer.ask(owner, user, item).deliver_now
  end
end
