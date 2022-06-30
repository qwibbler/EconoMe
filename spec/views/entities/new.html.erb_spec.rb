require 'rails_helper'

RSpec.describe 'entities/new', type: :feature do
  before do
    login

    @entity = Entity.new
    visit new_entity_path
  end

  it 'renders header' do
    expect(page).to have_selector('header')
    expect(page).to have_link('<')
    expect(page).to have_content('NEW TRANSACTION')
  end

  it 'renders new entity form' do
    expect(page).to have_selector('form[action="/entities"][method=post]') #, entities_path, 'post'
  end

  it 'renders the name input' do
    expect(page).to have_selector('input#entity_name')
  end

  it 'renders the amount input' do
    expect(page).to have_selector('input#entity_amount')
  end

  it 'renders a label' do
    expect(page).to have_selector('label')
    expect(page).to have_content('Please Select Groups for this Entity:')
  end

  it 'renders the dropdown' do
    expect(page).to have_selector('select#entity_entity_groups_attributes_0_group_id')
    expect(page).to have_selector('option')
    User.first.groups.each do |group|
      expect(page).to have_content(group.name)
    end
  end

  it 'renders the submit input' do
    expect(page).to have_selector('input[name=commit].active')
  end
end
