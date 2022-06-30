require 'rails_helper'

RSpec.describe 'groups/index', type: :feature do
  before do
    login

    @groups = Group.all
    visit groups_path
  end

  it 'renders header' do
    expect(page).to have_selector('header')
    expect(page).to have_link('<')
    expect(page).to have_content('CATEGORIES')
  end

  it 'renders all groups' do
    @groups.each do |group|
      expect(page).to have_content(group.name)
    end
  end

  it 'renders new button' do
    expect(page).to have_selector('button.green')
    expect(page).to have_content('New Category')
  end
end
