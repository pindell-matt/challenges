require 'rails_helper'

describe Order do
  context 'validations' do
    it { should validate_presence_of :customer_id }
    it { should validate_presence_of :merchant_id }
  end

  context 'associations' do
    it { should belong_to(:customer) }
    it { should belong_to(:merchant) }
    it { should have_many(:order_items) }
    it { should have_many(:items) }
  end
end
