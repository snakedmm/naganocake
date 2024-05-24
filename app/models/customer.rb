class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

 has_many :cart_items, dependent: :destroy
 has_many :items,through: :cart_item, dependent: :destroy
 has_many :orders, dependent: :destroy
 has_many :addresses, dependent: :destroy

 validates :email, presence: true, uniqueness: true
 validates :post_code, presence: true
 validates :address, presence: true
 validates :phone_number, presence: true
 validates :password, presence: true, length: { minimum: 6 }, on: :create # ユーザー新規登録時のみバリデーションを実行 
 validates :password_confirmation, presence: true, length: { minimum: 6 }, on: :create # ユーザー新規登録時のみバリデーションを実行 
 
 validates :last_name, :first_name, :last_name_kana, :first_name_kana, presence: { message: 'は必須項目です。' }
 validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角で入力して下さい。' }
 validates :last_name_kana, :first_name_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。' }
 
 # is_activeがtrueならfalseを返すようにしている
  def active_for_authentication?
    super && (is_active == true)
  end
 
  def full_name
    "#{last_name} #{first_name}"
  end

end
