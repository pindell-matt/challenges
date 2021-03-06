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

  it 'can create customers' do
    customer_data = { customer_name: "Fake Customer" }

    csv_parser = CsvParser.new

    expect(Customer.count).to eq(0)

    csv_parser.customer_parser(customer_data)

    expect(Customer.count).to eq(1)
    expect(Customer.first.name).to eq(customer_data[:customer_name])
  end

  it 'will not create duplicate customers' do
    customer_data = { customer_name: "Fake Customer" }

    csv_parser = CsvParser.new

    expect(Customer.count).to eq(0)

    csv_parser.customer_parser(customer_data)

    expect(Customer.count).to eq(1)

    csv_parser.customer_parser(customer_data)

    expect(Customer.count).to eq(1)
  end

  it 'can create merchants' do
    merchant_data = {
      merchant_name:    "Fake Company",
      merchant_address: "1234 Fake St."
    }

    csv_parser = CsvParser.new

    expect(Merchant.count).to eq(0)

    csv_parser.merchant_parser(merchant_data)

    expect(Merchant.count).to eq(1)
    expect(Merchant.first.name).to eq(merchant_data[:merchant_name])
    expect(Merchant.first.address).to eq(merchant_data[:merchant_address])
  end

  it 'will not create duplicate merchants' do
    merchant_data = {
      merchant_name:    "Fake Company",
      merchant_address: "1234 Fake St."
    }

    csv_parser = CsvParser.new

    expect(Merchant.count).to eq(0)

    csv_parser.merchant_parser(merchant_data)

    expect(Merchant.count).to eq(1)

    csv_parser.merchant_parser(merchant_data)

    expect(Merchant.count).to eq(1)
  end

  it 'can create items' do
    merchant = Merchant.create(name: "Fake Company", address: "1234 Fake St.")
    item_data = {
      item_description: "This is a description",
      item_price: 9.99
    }

    csv_parser = CsvParser.new

    expect(Item.count).to eq(0)

    csv_parser.item_parser(item_data, merchant.id)

    expect(Item.count).to eq(1)
    expect(Item.first.description).to eq(item_data[:item_description])
    expect(Item.first.price).to eq(item_data[:item_price])
    expect(Item.first.merchant).to eq(merchant)
  end

  it 'will not create duplicate items' do
    merchant = Merchant.create(name: "Fake Company", address: "1234 Fake St.")
    item_data = {
      item_description: "This is a description",
      item_price: 9.99
    }

    csv_parser = CsvParser.new

    expect(Item.count).to eq(0)

    csv_parser.item_parser(item_data, merchant.id)

    expect(Item.count).to eq(1)

    csv_parser.item_parser(item_data, merchant.id)

    expect(Item.count).to eq(1)
  end

  it 'can create orders' do
    customer = Customer.create(name: "Fake Customer")
    merchant = Merchant.create(name: "Fake Company", address: "1234 Fake St.")

    csv_parser = CsvParser.new

    expect(Order.count).to eq(0)

    csv_parser.order_parser(customer.id, merchant.id)

    expect(Order.count).to eq(1)
    expect(Order.first.customer).to eq(customer)
    expect(Order.first.merchant).to eq(merchant)
  end

  it 'can create order items' do
    customer = Customer.create(name: "Fake Customer")
    merchant = Merchant.create(name: "Fake Company", address: "1234 Fake St.")
    order = Order.create(customer_id: customer.id, merchant_id: merchant.id)
    item = Item.create(
      description: "This is a description",
      price: 9.99,
      merchant_id: merchant.id
    )

    csv_parser = CsvParser.new

    expect(OrderItem.count).to eq(0)

    csv_parser.order_item_parser(item.id, order.id, 12, 9.99)

    expect(OrderItem.count).to eq(1)
    expect(OrderItem.first.quantity).to eq(12)
    expect(OrderItem.first.unit_price).to eq(9.99)
  end
end
