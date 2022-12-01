class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.integer :price
      t.references :order, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.references :address, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
