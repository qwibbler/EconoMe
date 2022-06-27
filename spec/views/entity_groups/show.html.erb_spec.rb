require 'rails_helper'

RSpec.describe 'entity_groups/show', type: :view do
  before(:each) do
    @entity_group = assign(:entity_group, EntityGroup.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
