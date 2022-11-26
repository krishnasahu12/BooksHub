class CartsController < ApplicationController


    def create
    @cart = Cart.create(cart_params)
    if @cart.save
        redirect_to root_path
    end
    end




private
   
   def cart_params
      params.require(:cart).permit(:user_id)
   end
end
