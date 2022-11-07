# frozen_string_literal: true

describe 'example database' do
  it 'creates item' do
    Item.create(name: 'Book')
    expect(Item.count).to eq 1
  end

  it 'creates active item' do
    item = Item.create(name: 'Wheel', active: true)
    expect(Item.count).to eq 1
    expect(item.name).to eq 'Wheel'
    expect(item.active).to eq true
  end
end
