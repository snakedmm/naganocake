class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order
  
  def subtotal
    price * amount
  end
  
  enum making_status: { unprovable: 0, awaiting_production: 1, in_production: 2, production_completed: 3}
  
  
  
end
