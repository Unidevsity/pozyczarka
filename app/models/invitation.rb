# == Schema Information
#
# Table name: invitations
#
#  id            :bigint           not null, primary key
#  state         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  invited_by_id :bigint           not null
#  invited_id    :bigint           not null
#
# Indexes
#
#  index_invitations_on_invited_by_id  (invited_by_id)
#  index_invitations_on_invited_id     (invited_id)
#
class Invitation < ApplicationRecord
  include AASM

  aasm :column => 'state' do
    state :pending, initial: true
    state :accepted, :rejected

    event :accept do
      transitions from: :pending, to: :accepted
    end

    event :reject do
      transitions from: :pending, to: :rejected
    end
  end

  belongs_to :invited_user, class_name: 'User', foreign_key: :invited_id, optional: true
  belongs_to :inviting_user, class_name: 'User', foreign_key: :invited_by_id

  scope :not_processed, -> { where.not(state: ['accepted', 'rejected'])}
end
