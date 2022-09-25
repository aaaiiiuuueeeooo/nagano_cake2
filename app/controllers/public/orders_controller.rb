class Public::OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def confilm

    @cart_items = current_customer.cart_items
    @order = Order.new
    @total = @cart_items.inject(0) { |sum , item| sum + item.subtotal }
    @Claim = @total + 800
    @order.payment_method = params[:order][:payment_method]
    if params[:order][:address_flag] = "ご自身の住所"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.fullname

    elsif params[:order][:address_flag] = "登録済住所から選択"
      @order.postal_code = Address.find(params[:order][:postal_code])
      @order.address = Address.find(params[:order][:address])
      @order.name = Address.find(params[:order][:name])
    else params[:order][:address_flag] = "新しいお届け先"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
   end
  end

  def complete
  end

  def create
    @order = Order.new
    @order.save
    redirect_to complete_path
  end

  def new
    @order = Order.new
  end

  def show
  end


end
