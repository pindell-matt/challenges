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
    Customer.where(name: data[:customer_name]).first_or_create
  end

  def merchant_parser(data)
    Merchant.where(
      name:    data[:merchant_name],
      address: data[:merchant_address]
    ).first_or_create
  end

  def item_parser(data, merchant_id)
    Item.where(
      description: data[:item_description],
      price:       data[:item_price],
      merchant_id: merchant_id
    ).first_or_create
  end

end
