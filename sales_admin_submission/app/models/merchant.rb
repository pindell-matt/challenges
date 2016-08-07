class Merchant < ActiveRecord::Base
  has_many :items
  has_many :orders

  validates_presence_of :name
  validates_presence_of :address
  validates_uniqueness_of :name
  validates_uniqueness_of :address

  def self.total_sales_revenue
    joins(orders: :order_items)
      .sum("order_items.quantity * order_items.unit_price")
  end

  def total_revenue
    self.orders
        .joins(:order_items)
        .sum("order_items.quantity * order_items.unit_price")
  end
end
