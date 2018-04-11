class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper


  private
    def admin_user
      unless current_user && current_user.admin?
        flash[:danger] = "管理者権限がありません"
        redirect_to root_path
      end
    end 
end
