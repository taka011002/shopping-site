class AdminsController < ApplicationController
  before_action :admin_user
  def admin
  end

  def user
    @admin_users = User.where(admin: "t")
  end

  def product
    @product = Product.new
    @products = Product.all
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

  private
    def admin_user
      unless current_user && current_user.admin?
        flash[:danger] = "管理者権限がありません"
        redirect_to root_path
      end
    end
end
