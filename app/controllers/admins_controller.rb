class AdminsController < ApplicationController
  before_action :admin_user
  def admin
  end

  def user
    @admin_users = User.where(admin: "t")
  end

  def product
  end

  def order
  end

  def destroy
    User.find(params[:id]).toggle!(:admin)
    flash[:success] = "User deleted"
    redirect_to ardmin_user_path
  end

  private
    def admin_user
      unless current_user.admin?
        flash[:danger] = "管理者権限がありません"
        redirect_to root_path
      end
    end
end
