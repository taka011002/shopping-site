class AddIndexUniqueCartItem < ActiveRecord::Migration[5.1]
  def change
    add_index :cart_items, [:user_id, :product_id], unique: true
  end
end
