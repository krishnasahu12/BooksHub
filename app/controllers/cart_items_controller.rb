class CartItemsController < ApplicationController

  def index
    @cart_items = current_user.cart.cart_items
  end

  def new
    @cart_item = CartItem.new
  end

  def show
    @cart_item = CartItem.find(cart_item_params)
  end

  def cart
    @cart_items = CartItem.all  
    @cart_item = current_user.cart.cart_items.create(book_id: params[:id])
      respond_to do |format|
      if @cart_item.save
       format.js
      end
    end
  end


  private

  # def cart_item_params
  #   params.require(:cart_item).permit(:quantity, :cart_id)
  # end

end
