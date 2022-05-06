class Admin::HomesController < ApplicationController

  def top
    @orders = Order.all
    @amount = 0
    @customers = Customer.all
  end
end
