require 'rails_helper'

describe Customer do
  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
  end

  context 'associations' do
    it { should have_many(:orders) }
  end
end
