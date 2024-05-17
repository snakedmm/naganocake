class Item < ApplicationRecord
  
  has_one_attached :image
<<<<<<< HEAD
  enum status: { on_sale: 0, off_sale: 1 }
=======
  
  has_many :cart_items, dependent: :destroy
  has_many :customers,through: :cart_items , dependent: :destroy
  has_many :order_details, dependent: :destroy
  has_many :orders,through: :order_details , dependent: :destroy
  
  belongs_to :genre
>>>>>>> develop
  
end
