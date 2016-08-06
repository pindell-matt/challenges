class CsvParser

  def initialize(csv)
    parse_by_row(csv)
  end

  def parse_by_row(csv)
    CSV.foreach(csv, headers: true, header_converters: :symbol) do |row|
      customer = customer_parser(row)
    end
  end

  def customer_parser(data)
    Customer.create(name: data[:customer_name])
  end

end
