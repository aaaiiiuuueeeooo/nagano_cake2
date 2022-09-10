class Public::AddressesController < ApplicationController
  
  def index
    @addresses = Addresses.find(params[:id])
  end 
  
  def create
    @addresses = Addresses.find(params[:id])
    @addresses.save
    redirect_to addresses_path
  end 
  
  def edit
    @addresses = Addresses.find(params[:id])
  end
  
  def update
    @addresses = Addresses.find(params[:id])
    @addresses.update(addresses_params)
    redirect_to addresses_path(@addresses.id)
  end
  
  def destoroy
    @addresses = Addresses.find(params[:id])
    @addresses.destroy
    redirect_to addresses_path
  end
end
