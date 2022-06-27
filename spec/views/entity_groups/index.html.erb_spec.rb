require 'rails_helper'

RSpec.describe 'entity_groups/index', type: :view do
  before(:each) do
    assign(:entity_groups, [
             EntityGroup.create!,
             EntityGroup.create!
           ])
  end

  it 'renders a list of entity_groups' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
