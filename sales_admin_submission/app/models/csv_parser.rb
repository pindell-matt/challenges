class CsvParser

  def initialize(csv)
    parse_by_row(csv)
  end

  def parse_by_row(csv)
    CSV.foreach(csv, headers: true, header_converters: :symbol) do |row|
      customer = customer_parser(row)
      merchant = merchant_parser(row)
      item     = item_parser(row, merchant.id)
    end
  end

  def customer_parser(data)
    Customer.create(name: data[:customer_name])
  end

  def merchant_parser(data)
    Merchant.create(
      name:    data[:merchant_name],
      address: data[:merchant_address]
    )
  end

  def item_parser(data, merchant_id)
    Item.create(
      description: data[:item_description],
      price:       data[:item_price],
      merchant_id: merchant_id
    )
  end

end
