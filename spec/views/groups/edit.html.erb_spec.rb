require 'rails_helper'

RSpec.describe 'groups/edit', type: :feature do
  before do
    login

    @group = Group.first
    visit edit_group_path(@group)
  end

  it 'renders header' do
    expect(page).to have_selector('header')
    expect(page).to have_link('<')
    expect(page).to have_content('EDIT CATEGORY')
  end

  it 'renders the edit group form' do
    expect(page).to have_selector("form[action='/groups/#{@group.id}'][method=post]")
  end

  it 'renders the name input' do
    expect(page).to have_selector('input#group_name')
  end

  it 'renders the icon dropdown' do
    expect(page).to have_selector('select#group_icon')
    expect(page).to have_selector('option')
  end

  it 'renders the submit input' do
    expect(page).to have_selector('input[name=commit].active')
  end
end
