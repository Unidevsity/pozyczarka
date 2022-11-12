# frozen_string_literal: true

class ItemsManager
  def fix_items_and_users_associations(user:)
    items_without_user = Item.where(user_id: nil)
    items_without_user.each do |item|
      item.update(user:)
    end
  end
end
