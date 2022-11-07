# frozen_string_literal: true

Rails.logger.debug 'Generating fake items'
20.times do
  Item.find_or_create_by(name: Faker::Books::CultureSeries.book, active: true, borrowed: false)
end

Rails.logger.debug "#{Item.count} items generated"
