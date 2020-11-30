class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :first_name_kana
    validates :last_name
    validates :last_name_kana
  end
    validates :password, presence: true
    validates :password, length: { minimum: 6 }
    VALID_PASSWORD_REGIX = /\A[a-z0-9]+\z/i
    validates :password, format: { with: VALID_PASSWORD_REGIX }
    validates :nickname, presence: true
    validates :birthday, presence: true

   has_many  :orders
   has_many  :items
end