class Admin::HomesController < ApplicationController
  
  def top
    @homes = Order.all
  end 
end
