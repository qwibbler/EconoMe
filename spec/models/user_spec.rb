require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'John', email: 'john@example.com', password: 'password')
  end

  before(:example) { subject.save }

  it 'should be valid' do
    expect(subject).to be_valid
  end

  describe 'Name should be' do
    it 'present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'greater than or equal to 3 characters' do
      subject.name = 'ab'
      expect(subject).to_not be_valid
    end

    it 'between 3 and 30 characters' do
      subject.name = 'tom'
      expect(subject).to be_valid
    end

    it 'less than or equal 30 characters' do
      subject.name = 't' * 31
      expect(subject).to_not be_valid
    end
  end

  it 'should start with 4 groups' do
    expect(subject.groups.size).to eq(4)
  end
end
