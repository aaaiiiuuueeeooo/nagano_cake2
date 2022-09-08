class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(user_params)
    redirect_to customer_path(@customer.id)
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer = destoroy
    redirect_to customer_path
  end

  def unsubscribe
    @customer = current_customer
  end
end
