require 'rails_helper'

RSpec.describe 'entities/show', type: :feature do
  before do
    login

    @entity = Entity.find_by(name: 'Test2')
    @groups = @entity.groups
    visit entity_path(@entity)
  end

  it 'renders header' do
    expect(page).to have_link('<')
    expect(page).to have_content('TRANSACTION')
    expect(page).to have_link('✎')
  end

  it 'renders entity name' do
    expect(page).to have_content(@entity.name)
  end

  it 'renders entity amount' do
    expect(page).to have_content(@entity.amount)
  end

  it 'renders entity groups' do
    expect(page).to have_content(@groups.first.name)
    expect(page).to have_content(@groups.last.name)
  end
end
