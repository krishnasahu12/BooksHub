class CartItemsController < ApplicationController

  def index
    @cart_items = current_user.cart.cart_items
  end

  def new
    @cart_item = current_user.cart.cart_items.new
  end

  def show
    @cart_item = current_user.cart.cart_items.find(cart_item_params)
  end

  def update
    @cart_item.update()
    respond_to do |format|
        if @cart_item.update
            format.js
        end
    end
  end

  def decrease
    @cart_item = CartItem.find(params[:id])
    respond_to do |format|
        if @cart_item.update(quantity: @cart_item.quantity - 1)
            format.js
        end
    end
  end

  def increase
    @cart_item = CartItem.find(params[:id])
        respond_to do |format|
        if @cart_item.update(quantity: @cart_item.quantity + 1)
            format.js
        end
    end
  end

  def cart
    @cart_items = current_user.cart.cart_items.all  
    @cart_item = current_user.cart.cart_items.create(book_id: params[:id])
      respond_to do |format|
      if @cart_item.save
       format.js
      end
    end
  end

  def destroy
    respond_to do |format|
        if @cart_item.delete
            format.js
        else
            redirect_to :back , notice: "item is not added to cart"
        end
    end  
end

end
