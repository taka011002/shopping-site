class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
  end

  def admin
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
  
end
