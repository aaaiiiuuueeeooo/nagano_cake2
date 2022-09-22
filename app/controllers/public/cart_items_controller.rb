class Public::CartItemsController < ApplicationController

  def index
    @cart_item = CartItem.all
  end

  def create
    @cart_item = CartItem.new(cart_item_params) #カート内に同じ商品があった場合
    cart_item=CartItem.find_by(item_id: cart_item_params[:item_id])
      if cart_item.item_id == @cart_item.item_id
       new_quantity = cart_item.quantity + @cart_item.quantity
       cart_item.update_attribute(:quantity, new_quantity)
       @cart_item.delete
      else #カート内に同じ商品がなかった場合
      @cart_item.save
      redirect_to :cart_items_path
      end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id,:customer_id,:amount)
  end
end
