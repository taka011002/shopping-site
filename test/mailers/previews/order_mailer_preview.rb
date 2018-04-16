# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/order_mailer/order_confirm
  def order_confirm
    order = Order.find("4")
    OrderMailer.order_confirm(order)
  end

end
