# frozen_string_literal: true

require_relative '../../lib/items_manager'

describe ItemsManager do
  subject(:manager) { described_class.new }

  let!(:items) { create_list(:item, 5) }
  let!(:user) { create(:user) }

  it 'fixes items and users association' do
    manager.fix_items_and_users_associations(user:)
    items.each do |item|
      expect(item.reload.user).to eq user
    end
  end
end
