# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    name { Faker::Lorem.characters(number: 4) }
    borrowed { false }
    active { true }
    item_type { :book }
  end
end
