class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant
  has_many :order_items
  has_many :items, through: :order_items

  validates_presence_of :customer_id
  validates_presence_of :merchant_id
end
