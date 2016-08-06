class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :customer, index: true, foreign_key: true
      t.references :merchant, index: true, foreign_key: true
      t.references :item, index: true, foreign_key: true
      t.integer :quantity
      t.float :total_price
    end
  end
end
