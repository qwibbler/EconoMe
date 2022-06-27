require 'rails_helper'

RSpec.describe 'entities/index', type: :view do
  before(:each) do
    assign(:entities, [
             Entity.create!,
             Entity.create!
           ])
  end

  it 'renders a list of entities' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
