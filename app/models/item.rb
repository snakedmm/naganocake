class Item < ApplicationRecord
  
  has_one_attached :image
  
  has_many :cart_items, dependent: :destroy
  has_many :customers,through: :cart_items , dependent: :destroy
  has_many :order_details, dependent: :destroy
  has_many :orders,through: :order_details , dependent: :destroy
  
  belongs_to :genre
<<<<<<< HEAD
  
=======

>>>>>>> 9bb7c41 (コンフリクト修正)
  def add_tax_price
    (self.price * 1.10).round
  end
  
  def self.active_items_count
    where(is_active: true).count

  end
  
end
