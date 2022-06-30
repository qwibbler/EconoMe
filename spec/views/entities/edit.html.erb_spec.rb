require 'rails_helper'

RSpec.describe 'entities/edit', type: :feature do
  before do
    login

    @entity = Entity.first
    visit edit_entity_path(@entity)
  end

  it 'renders header' do
    expect(page).to have_selector('header')
    expect(page).to have_link('<')
    expect(page).to have_content('EDIT TRANSACTION')
  end

  it 'renders new entity form' do
    expect(page).to have_selector("form[action='/entities/#{@entity.id}'][method=post]")
  end

  it 'renders the name input' do
    expect(page).to have_selector('input#entity_name')
  end

  it 'renders the amount input' do
    expect(page).to have_selector('input#entity_amount')
  end

  it 'renders the submit input' do
    expect(page).to have_selector('input[name=commit].active')
  end
end
