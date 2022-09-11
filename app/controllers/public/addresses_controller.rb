class Public::AddressesController < ApplicationController

  def index
    @addresses = current_customer.addresses
  end

  def create
    @addresses = Address.new(address_params)
    @addresses.customer_id = current_customer.id
    @addresses.save
    redirect_to addresses_path(@addresses.id)
  end

  def edit
    @addresses = Address.find(params[:id])
  end

  def update
    @addresses = Address.find(params[:id])
    @addresses.update(addresses_params)
    redirect_to addresses_path(@addresses.id)
  end

  def destoroy
    @addresses = Address.find(params[:id])
    @addresses.destroy
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:postal_code,:address,:name)
  end
end
