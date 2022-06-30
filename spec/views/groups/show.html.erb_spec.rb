require 'rails_helper'

RSpec.describe 'groups/show', type: :feature do
  before do
    login

    @group = Group.first
    visit group_path(@group)
  end

  it 'renders header' do
    expect(page).to have_selector('header')
    expect(page).to have_link('<')
    expect(page).to have_content(@group.name.upcase)
  end

  it 'renders total price' do
    expect(page).to have_content('$700')
  end

  it 'renders transactions' do
    @group.entities.each do |entity|
      expect(page).to have_content(entity.name)
    end
  end
end
