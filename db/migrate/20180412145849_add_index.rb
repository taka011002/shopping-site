class AddIndex < ActiveRecord::Migration[5.1]
  def change
    add_index :cart_items, :user_id
    add_index :cart_items, :product_id
  end
end
