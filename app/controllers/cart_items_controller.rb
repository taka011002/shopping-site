class CartItemsController < ApplicationController
  before_action :logged_in_user
  def index
    @cart_items = current_user.cart_items.all
  end


  def create
    product = Product.find(params[:product_id])
    current_user.cart_items.create(product_id: product.id)
    redirect_to products_path
  end
end
