class ProductsController < ApplicationController
  before_action :admin_user, only: [:create, :destroy]

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:secces] = "商品を登録できました"
      redirect_to admin_product_path
    else
      flash[:danger] = "商品の登録に失敗しました"
      @products = Product.all
      render "admins/product"
    end
  end

  def index
  end

  private

    def product_params
      params.require(:product).permit(:name,
                :price, :description, :picture)
    end
end
