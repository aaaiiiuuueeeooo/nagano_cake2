class Admin::OrdersController < ApplicationController
  
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end 
  
  def update
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.find(params[:id])
    
  end 
end
