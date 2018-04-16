class CartItemsController < ApplicationController
  before_action :logged_in_user
  def index
    @cart_items = current_user.cart_items.all
    @cart_sum = current_user.products.sum(:price)
  end


  def create
    product = Product.find(params[:product_id])
    #unless CartItem.find_by(user_id: current_user.id,product_id: product.id)
      current_user.cart_items.create(product_id: product.id)
      flash[:success] = "カートに追加しました"
      redirect_to products_path
    #else flash[:danger] = "既にカート入っています"
      #redirect_to products_path
    #end
  end

  def destroy
    cart = CartItem.find(params[:id]).destroy
    redirect_to cart_items_path
  end

end
