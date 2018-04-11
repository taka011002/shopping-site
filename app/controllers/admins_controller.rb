class AdminsController < ApplicationController
  before_action :admin_user

  def admin
  end

  def user
    @admin_users = User.where(admin: "t")
  end

  def product
    @product = Product.new
    @products = Product.paginate(page: params[:page])
  end

  def order
  end

  def admin_destroy
    @admin = User.find_by(id: params[:id])
    @admin.toggle!(:admin)
    flash[:success] = "管理者権限を変更しました"
    redirect_to admin_user_path
  end

  def admin_create
    @user = User.find_by(email: params[:email])
    if @user && !@user.admin?
      @user.toggle!(:admin)
      flash[:success] = "管理者権限を変更しました"
    else
      flash[:danger] ="ユーザーが存在しないか既に管理ユーザーです"
    end
      redirect_to admin_user_path
  end

end
