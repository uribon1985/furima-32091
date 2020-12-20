class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  with_options presence: true do
    validates :name                       #商品名
    validates :product_description        #商品説明
    validates :image
  end

  with_options numericality: { other_than: 1} do
    validates :category_id                #カテゴリー
    validates :product_condition_id       #商品の状態
    validates :shipping_charge_id        #配送料の負担
    validates :estimated_shipping_id      #配送日数
  end

  validates :shipping_area_id, numericality: { other_than: 0}   #発送元の地域
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "is out of setting range"}
  validates :price, format: { with: /\A[-]?[0-9]+(\.[0-9]+)?\z/, message: '半角数字のみで入力してください' }

  has_one_attached :image
  belongs_to :user
  belongs_to :shipping_charge
  belongs_to :category
  belongs_to :estimated_shipping
  belongs_to :product_condition
  belongs_to :shipping_area
  has_one    :order
end

