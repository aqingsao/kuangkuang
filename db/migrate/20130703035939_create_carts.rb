class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :user_id
      t.timestamps
    end

    create_table :carts_products do |t|
      t.belongs_to :cart
      t.belongs_to :product
    end
  end
end
