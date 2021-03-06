require 'rails_helper'

RSpec.describe Entity, type: :model do
  subject do
    u = User.new(name: 'John', email: 'john@example.com', password: 'password')
    Entity.new(
      user: u,
      name: 'McD',
      amount: 5
    )
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
      subject.name = 'food'
      expect(subject).to be_valid
    end

    it 'less than or equal 30 characters' do
      subject.name = 't' * 31
      expect(subject).to_not be_valid
    end
  end

  describe 'Amount should  be' do
    it 'present' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end

    it 'a number' do
      subject.amount = 'ab'
      expect(subject).to_not be_valid
    end

    it 'greater than or equal to zero' do
      subject.amount = -1
      expect(subject).to_not be_valid
    end
  end
end
