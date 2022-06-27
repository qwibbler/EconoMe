require 'rails_helper'

RSpec.describe 'entity_groups/edit', type: :view do
  before(:each) do
    @entity_group = assign(:entity_group, EntityGroup.create!)
  end

  it 'renders the edit entity_group form' do
    render

    assert_select 'form[action=?][method=?]', entity_group_path(@entity_group), 'post' do
    end
  end
end
