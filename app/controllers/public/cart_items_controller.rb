class Public::CartItemsController < ApplicationController

  def index
    @cart_item = current_customer.cart_items
    @total_payment = 0
  end

  def create
    @cart_item = CartItem.new(cart_item_params) #カート内に同じ商品があった場合
    cart_item=CartItem.find_by(item_id: cart_item_params[:item_id])
      if cart_item
       new_amount = cart_item.amount + @cart_item.amount
       cart_item.update_attribute(:amount, new_amount)
       @cart_item.delete
      else #カート内に同じ商品がなかった場合
      @cart_item.save
      end
      redirect_to cart_items_path
  end

   def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
   end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id,:customer_id,:amount)
  end
end
