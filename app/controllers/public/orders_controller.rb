class Public::OrdersController < ApplicationController

  def new
    @new_order = Order.new
    @order = current_customer
  end

  def create
     @order = Order.new(order_params)
     @order.customer_id = current_customer.id
     @order.save
     @cart_items = current_customer.cart_items
     @cart_items.each do |cart_item|
     @order_detail = OrderDetail.new(price:cart_item.item.with_tax_price, amount:cart_item.amount, item_id:cart_item.item_id, order_id: @order.id)
     @order_detail.save
     end
     redirect_to  thank_you_public_orders_path
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @order.shipping_cost = 800
    @order.payment_method = params[:order][:payment_method]
    @order.total_payment = @cart_items.sum(&:subtotal)
    select_address = params[:order][:select_address]
    if select_address == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif select_address == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif select_address== "2"

    end
  end

   def show
      @order = Order.find(params[:id])
      @order_details = @order.order_details
   end

  def index
    @orders = current_customer.orders
    @cart_items = current_customer.cart_items
  end



  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :status, :customer_id, :payment_method)
  end



end
