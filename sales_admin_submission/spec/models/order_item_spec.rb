require 'rails_helper'

describe OrderItem do
  context 'validations' do
    it { should validate_presence_of :item_id }
    it { should validate_presence_of :order_id }
    it { should validate_presence_of :quantity }
    it { should validate_presence_of :unit_price }
  end

  context 'associations' do
    it { should belong_to(:item) }
    it { should belong_to(:order) }
  end
end
