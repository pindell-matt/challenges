class Item < ActiveRecord::Base
  belongs_to :merchant
  belongs_to :order

  validates_presence_of :description
  validates_presence_of :price
  validates_presence_of :merchant_id
end
