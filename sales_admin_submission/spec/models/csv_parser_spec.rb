require 'rails_helper'

describe CsvParser do
  before :each do
    @filepath = Rails.root.join('..', 'sales_admin', 'salesdata.csv')
  end

  it 'should parse csv and populate database' do
    expect(Customer.count).to eq(0)
    expect(Merchant.count).to eq(0)
    expect(Item.count).to eq(0)
    expect(Order.count).to eq(0)
    expect(OrderItem.count).to eq(0)

    CsvParser.new(@filepath)

    expect(Customer.count).to eq(4)
    expect(Merchant.count).to eq(4)
    expect(Item.count).to eq(4)
    expect(Order.count).to eq(5)
    expect(OrderItem.count).to eq(5)
  end
end
