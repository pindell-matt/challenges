class ChangeOrders < ActiveRecord::Migration
  def change
    remove_reference :orders, :item, index: true, foreign_key: true
    remove_column :orders, :quantity
    remove_column :orders, :total_price
  end
end
