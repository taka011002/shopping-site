class ProductsController < ApplicationController
  before_action :admin_user, only: [:admin_index, :create, :destroy, :edit, :update]

  def index
    @products = Product.paginate(page: params[:page] ,per_page: 6)
  end

  def admin_index
    @product = Product.new
    @products = Product.paginate(page: params[:page])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "商品を登録できました"
      redirect_to admin_product_path
    else
      flash[:danger] = "商品の登録に失敗しました"
      @products = Product.paginate(page: params[:page])
      render 'admin_index'
    end
  end

  def destroy
    Product.find(params[:id]).destroy
    flash[:success] = "商品を削除しました"
    redirect_to admin_product_path
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      flash[:success] = "商品を編集しました"
      redirect_to admin_product_path
    else
      render 'edit'
    end
  end

  private

    def product_params
      params.require(:product).permit(:name,
                :price, :description, :main_image)
    end


end
