class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details

  enum payment_method: { credit_card: 0, transfer: 1 }
  
  def sum_of_order_price
    subtotal + shipping_cost
  end

end
