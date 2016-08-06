require 'rails_helper'

describe Order do
  context 'validations' do
    it { should validate_presence_of :customer_id }
    it { should validate_presence_of :merchant_id }
    it { should validate_presence_of :item_id }
    it { should validate_presence_of :quantity }
    it { should validate_presence_of :total_price }
  end

  context 'associations' do
    it { should belong_to(:customer) }
  end
end
