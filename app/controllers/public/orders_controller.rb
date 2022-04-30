class Public::OrdersController < ApplicationController
  
  def new 
    @new_order = Order.new
  end 
  
end
