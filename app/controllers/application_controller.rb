class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper


  private
     def admin_user_now
       unless logged_in? && admin?
         flash[:danger] = "管理者権限がありません"
         redirect_back(fallback_location: root_path)
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
