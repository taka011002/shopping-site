class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      if current_user.admin?
      redirect_to admin_path
      else
      redirect_back_or products_path
      end
    else
      flash.now[:danger] = 'EmailかPasswordが間違っています'
      render 'new'
    end
  end


  def destroy
    log_out
    redirect_to root_url
  end

end
