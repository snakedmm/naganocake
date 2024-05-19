class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

 has_many :cart_items, dependent: :destroy
 has_many :items,through: :cart_item, dependent: :destroy
 has_many :orders, dependent: :destroy
 has_many :addresses, dependent: :destroy

 validates :last_name, presence: true
 validates :first_name, presence: true
 validates :last_name_kana, presence: true
 validates :first_name_kana, presence: true
 validates :email, presence: true
 validates :post_code, presence: true
 validates :address, presence: true
 validates :phone_number, presence: true
 validates :password, presence: true, length: { minimum: 6 }, on: :create # ユーザー新規登録時のみバリデーションを実行 
 validates :password_confirmation, presence: true, length: { minimum: 6 }, on: :create # ユーザー新規登録時のみバリデーションを実行 
 
 # is_activeがtrueならfalseを返すようにしている
  def active_for_authentication?
    super && (is_active == true)
  end
 


end
