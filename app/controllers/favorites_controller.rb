class FavoritesController < ApplicationController
  before_action :logged_in_user
  def index
    @favorite_items = current_user.favorites.products.all
  end


  def create
    product = Product.find(params[:product_id])
    current_user.favorite.create(product_id: product.id)
    flash[:success] = "お気に入りに追加しました"
    redirect_to products_path
  end

  def destroy
    cart = Favorite.find(params[:id]).destroy
    redirect_to cart_items_path
  end

end
