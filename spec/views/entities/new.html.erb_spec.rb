require 'rails_helper'

RSpec.describe 'entities/new', type: :view do
  before(:each) do
    assign(:entity, Entity.new)
  end

  it 'renders new entity form' do
    render

    assert_select 'form[action=?][method=?]', entities_path, 'post' do
    end
  end
end
