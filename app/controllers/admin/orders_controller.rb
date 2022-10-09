class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.find(params[:id])
      if @order
        @order.update(params[:id])
      else
        @prder_detail.update(params[:id])
      end
    redirect_to admin_order_path
  end
end
