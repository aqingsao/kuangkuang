class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.integer :order_id
      t.integer :cart_id

      t.timestamps
    end
  end
end
