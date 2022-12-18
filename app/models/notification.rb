# == Schema Information
#
# Table name: notifications
#
#  id         :bigint           not null, primary key
#  data       :json
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_notifications_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Notification < ApplicationRecord
  include ActionView::RecordIdentifier
  belongs_to :user

  after_create_commit do
    broadcast_append_to [user, :notifications], target: 'notifications_list', partial: 'notifications/notification', locals: { notification: self }
    broadcast_replace_to [user, :notifications], target: dom_id(user, :notifications_badge), partial: 'notifications/notifications_badge', locals: { user: user }
  end
end
