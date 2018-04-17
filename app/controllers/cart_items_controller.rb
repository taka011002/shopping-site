class CartItemsController < ApplicationController
  before_action :logged_in_user
  def index
    @cart_items = current_user.cart_items.all
    @cart_sum = current_user.products.sum(:price)
  end


  def create
    product = Product.find(params[:product_id])
    current_user.cart_items.create(product_id: product.id)
    flash[:success] = "カートに追加しました"
    redirect_to products_path
  end

  def destroy
    cart = CartItem.find(params[:id]).destroy
    redirect_to cart_items_path
  end

end
