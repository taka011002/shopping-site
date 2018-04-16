class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper


  private
     def admin_user_now
       unless current_user && current_user.admin?
         flash[:danger] = "管理者権限がありません"
         redirect_to root_path
       end
     end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "ログインしてください"
        redirect_to login_url
      end
    end

end
