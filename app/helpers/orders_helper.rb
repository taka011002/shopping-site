module OrdersHelper

  def status(order)
     case order.status
     when 1
       "入金待ち"
     when 2
       "発送待ち"
     when 3
       "発送完了"
    end
  end

end
