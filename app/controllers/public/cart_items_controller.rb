class Public::CartItemsController < ApplicationController
  
  def index
    @cart_item = Cart_item.all
  end
end
