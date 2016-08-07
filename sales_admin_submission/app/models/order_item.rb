class OrderItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :order

  validates_presence_of :item_id
  validates_presence_of :order_id
  validates_presence_of :quantity
  validates_presence_of :unit_price
end
