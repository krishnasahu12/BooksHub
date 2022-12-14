class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :country
      t.string :pincode
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
