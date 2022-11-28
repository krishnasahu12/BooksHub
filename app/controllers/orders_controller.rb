class OrdersController < ApplicationController

    def create
        @order = Order.create(order_params)
        if @order.save
            redirect_to root_path
        end
        end
    
    private
       
       def order_params
          params.require(:order).permit(:user_id)
       end
    end
    
end
