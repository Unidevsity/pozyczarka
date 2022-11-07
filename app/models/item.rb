# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id         :bigint           not null, primary key
#  active     :boolean
#  borrowed   :boolean
#  item_type  :integer          default("other"), not null
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Item < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }

  enum item_type: { book: 0, cd: 1, electric_device: 2, flower: 3, other: 4 }
  validates :item_type, inclusion: { in: item_types.keys }

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :borrowed, -> { where(borrowed: true) }
  scope :on_place, -> { where(borrowed: false) }
end
