class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  
  def subtotal
    item.add_tax_price * amount
  end
  
  def self.calculate_total_price(cart_items)
    cart_items.inject(0) { |sum, item| sum + item.subtotal }
  end


end

