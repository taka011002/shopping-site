class ProductsController < ApplicationController
  before_action :admin_user, only: [:create, :destroy]

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "商品を登録できました"
      redirect_to admin_product_path
    else
      flash[:danger] = "商品の登録に失敗しました"
      @products = Product.paginate(page: params[:page])
      render "admins/product"
    end
  end

  def destroy
    Product.find(params[:id]).destroy
    flash[:success] = "商品を削除しました"
    redirect_to admin_product_path
  end


  def index
  end

  private

    def product_params
      params.require(:product).permit(:name,
                :price, :description, :main_image)
    end
end
