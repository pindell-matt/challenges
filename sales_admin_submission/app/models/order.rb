class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant

  validates_presence_of :customer_id
  validates_presence_of :merchant_id
  validates_presence_of :item_id
  validates_presence_of :quantity
end
