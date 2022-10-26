p "Generating fake items"
20.times do
  Item.find_or_create_by(name: Faker::Books::CultureSeries.book, active: true, borrowed: false)
end

p "#{Item.count} items generated"



