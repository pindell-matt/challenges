require 'rails_helper'

describe Item do
  context 'validations' do
    it { should validate_presence_of :description }
    it { should validate_presence_of :price }
    it { should validate_presence_of :merchant_id }

    it { should validate_uniqueness_of :description }
  end

  context 'associations' do
    it { should belong_to(:merchant) }
  end
end
