class Admin::HomesController < ApplicationController

  def top
    @homes = OrderDetail.all
  end
end
