class Order < ActiveRecord::Base
  validates_presence_of :customer_id
  validates_presence_of :merchant_id
  validates_presence_of :item_id
  validates_presence_of :quantity
  validates_presence_of :total_price
end