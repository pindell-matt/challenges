class Item < ActiveRecord::Base
  validates_presence_of :description
  validates_presence_of :price
  validates_presence_of :merchant_id
end
