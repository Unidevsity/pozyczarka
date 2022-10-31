FactoryBot.define do
  factory :item do
    name { Faker::Lorem.characters(number: 5) }
    borrowed { false }
    active { true }
    item_type { :book }
  end
end
