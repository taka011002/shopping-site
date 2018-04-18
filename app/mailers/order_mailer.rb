class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.order_confirm.subject
  #
  def order_confirm(order)
    #attachments.inline['image.jpg'] = File.read('')
    order.product.each do |image|
      attachments.inline[image.main_image_identifier] = File.read(image.main_image.thumb.current_path)
    end

    @order = order
    @order_items = order.order_items.all
    @order_sum = order.order_items.sum(:price)
    mail to: order.user.email, subject: "注文の確認"
  end
end
