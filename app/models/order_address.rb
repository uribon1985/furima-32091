class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :shipping_area_id, :address, :building_name, :phone_number, :municipality, :user_id, :item_id
  
  with_options presence: true do
    validates :postal_code,format: { with: /\A\d{3}[-]\d{4}\z/, message: 'ハイフンをつけてください' }         #郵便番号
    validates :phone_number, format: { with: /\A\d{11}\z/ , message: '11桁にしてください' } 
    validates :phone_number, format: { with: /\A[0-9]+\z/ , message: '全て数字にしてください' } 
    validates :token 
    validates :municipality
    validates :address
    validates :user_id
    validates :item_id
  end

  validates :shipping_area_id, numericality: { other_than: 0}   #発送元の地域

  def save
    order = Order.create(user_id: user_id,item_id: item_id)
    Address.create(postal_code: postal_code, shipping_area_id: shipping_area_id, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id, municipality: municipality)
  end

end









