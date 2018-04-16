class UsersController < ApplicationController
  before_action :admin_user_now, only: [:admin_user, :admin_destroy, :admin_create]

  def new
    @user = User.new
  end

  def orders
    @orders = current_user.orders.paginate(page: params[:page], per_page: 5)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "どうぞお買い物をお楽しみください"
      log_in @user
      redirect_to root_path
    else
      render 'new'
    end
  end

  def index
  end

  def admin_user
    @admin_users = User.where(admin: "t")
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
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  # def admin_user
  #        unless current_user && current_user.admin?
  #          flash[:danger] = "管理者権限がありません"
  #          redirect_to root_path
  #        end
  #    end


end
