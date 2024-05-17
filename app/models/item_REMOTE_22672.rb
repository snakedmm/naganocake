class Item < ApplicationRecord
  
  has_one_attached :image
  
  has_many :cart_items, dependent: :destroy
  has_many :customers,through: :cart_items , dependent: :destroy
  has_many :order_details, dependent: :destroy
  has_many :orders,through: :order_details , dependent: :destroy
  
  belongs_to :genre
  
end
