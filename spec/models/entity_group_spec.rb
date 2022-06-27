require 'rails_helper'

RSpec.describe EntityGroup, type: :model do
  subject do
    u = User.new(name: 'John', email: 'john@example.com', password: 'password')
    e = Entity.new(user: u, name: 'McD', amount: 5)
    g = Group.new(user: u, name: 'Food', icon: 'icon')
    EntityGroup.new(entity: e, group: g)
  end
  before(:example) { subject.save }

  it 'should be valid' do
    expect(subject).to be_valid
  end
end
