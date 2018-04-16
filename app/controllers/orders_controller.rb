class OrdersController < ApplicationController
 before_action :admin_user_now, only:[:admin_index]
 before_action :logged_in_user

  def index
    @order_items = current_user.products.all
    @order_sum = current_user.products.sum(:price)
    @order = Order.new
    @order.order_items.build
  end

  def admin_index
    @orders = Order.paginate(page: params[:page], per_page: 5)
  end

  def create
     order = Order.new(order_params)
     order.save
     OrderMailer.order_confirm(order).deliver_now
     current_user.cart_items.destroy_all
     flash[:info] = "商品を注文しました"
     redirect_to root_path
  end

  def update
    order = Order.find(params[:id])
    order.update(status: "#{order.status + 1}")
    redirect_to admin_order_path
  end

  private
    def order_params
      params.require(:order).permit(:user_id,
                order_items_attributes: [:product_id,:price])
    end
end
