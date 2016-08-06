class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :description
      t.float :price
      t.references :merchant, index: true, foreign_key: true
    end
  end
end
