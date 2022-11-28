class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.integer :quantity, default: 1
      t.references :cart, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
    add_index :cart_items, [:cart_id, :book_id], unique: true, name: :cart_name
  end
end
