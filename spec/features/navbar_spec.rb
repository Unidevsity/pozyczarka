# frozen_string_literal: true

describe 'Navbar' do
  before do
    visit '/'
  end

  it 'has link to All items' do
    expect(page).to have_link('All')
  end

  it 'has link to active items' do
    expect(page).to have_link('Active')
  end

  it 'has link to inactive items' do
    expect(page).to have_link('Inactive')
  end

  it 'has link to borrowed items' do
    expect(page).to have_link('Borrowed')
  end

  it 'has link to items on place' do
    expect(page).to have_link('On place')
  end
end
