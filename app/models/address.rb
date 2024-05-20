class Address < ApplicationRecord
  belongs_to :customer
  
  validates :post_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
  
  def address_display
  '〒' + postal_code + ' ' + address + ' ' + name
  end
<<<<<<< HEAD

=======
>>>>>>> a955b40 (カート機能、注文機能作成中)
end
