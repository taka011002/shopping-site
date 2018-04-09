class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
  end

  def admin
  end
end
