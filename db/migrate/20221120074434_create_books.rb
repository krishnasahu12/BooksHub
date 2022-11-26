class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :degree
      t.string :course
      t.string :book_name
      t.string :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
