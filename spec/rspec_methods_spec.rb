describe Item do
  it 'creates item with name' do
    item = Item.create(name: 'book')
    expect(item.name).to eq 'book'
  end

  context 'when name not passed' do
    it 'does not create item' do
      item = Item.create(name: '')
      expect(Item.count).to eq 0
    end
  end

  context 'when name too short' do
    it 'does not create item' do
      item = Item.create(name: 'as')
      expect(Item.count).to eq 0
    end

    it 'is not valid' do
      item = Item.new(name: 'as')
      expect(item.valid?).to eq false
    end
  end
end
