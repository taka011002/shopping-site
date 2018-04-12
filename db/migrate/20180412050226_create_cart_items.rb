class CreateCartItems < ActiveRecord::Migration[5.1]
  def change
    create_table :cart_items do |t|
      t.intger :user_id
      t.intger :product_id
      t.intger :quantity

      t.timestamps
    end
  end
end
