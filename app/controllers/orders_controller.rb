class OrdersController < ApplicationController

  def index
    @order_items = current_user.order.order_items
  end

  
end
