require 'rails_helper'

describe Merchant do
  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }

    it { should validate_uniqueness_of :name }
    it { should validate_uniqueness_of :address }
  end

  context 'associations' do
    it { should have_many(:items) }
    it { should have_many(:orders) }
  end
end
