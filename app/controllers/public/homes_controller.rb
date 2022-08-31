class Public::HomesController < ApplicationController
  def top
    @homes = Genre.all
  end
end
