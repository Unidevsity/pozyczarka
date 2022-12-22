# == Schema Information
#
# Table name: messages
#
#  id            :bigint           not null, primary key
#  body          :text
#  read_at       :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  receipient_id :integer          not null
#  sender_id     :integer          not null
#
# Indexes
#
#  index_messages_on_receipient_id  (receipient_id)
#  index_messages_on_sender_id      (sender_id)
#
class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  belongs_to :receipient, class_name: 'User', foreign_key: 'receipient_id'

  def self.between(sender, receipient)
    Message.where(sender_id: [sender.id, receipient.id], receipient_id: [sender.id, receipient.id])
  end
end
