class Order < ApplicationRecord
  
  def new
    @order = current_user
  end
end
