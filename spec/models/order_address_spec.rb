require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '#create' do
    before do
      seller = FactoryBot.create(:user)
      @buyer = FactoryBot.create(:user)
      @item = FactoryBot.create(:item, user_id: seller.id)
      @order_address= FactoryBot.build(:order_address, user_id: @buyer.id,item_id: @item.id)
    end

    it 'postal_codeとshipping_area_idとmunicipalityとphone_numberとaddressとtokenとbuilding_nameが存在していれば保存できる事'do
     expect(@item).to be_valid
    end

    it '郵便番号が必須であること'do
     @order_address.postal_code = ""
     @order_address.valid?
     expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it '郵便番号にはハイフンが必要であること'do
      @order_address.postal_code = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code ハイフンをつけてください")
    end



    it '配送先の情報が必須であること'do
     @order_address.shipping_area_id = 0
     @order_address.valid?
     expect(@order_address.errors.full_messages).to include("Shipping area must be other than 0")
    end

    it '市区町村の情報が必須であること'do
     @order_address.municipality = ""
     @order_address.valid?
     expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
    end

    it '番地の情報が必須であること'do
     @order_address.address = ""
     @order_address.valid?
     expect(@order_address.errors.full_messages).to include("Address can't be blank")
    end

    it '電話番号は数字のみでないと登録できないこと'do
     @order_address.phone_number = "aあア"
     @order_address.valid?
     expect(@order_address.errors.full_messages).to include("Phone number 全て数字にしてください")
    end

    it '電話番号にはハイフン不要で11桁以内でないと登録できないこと'do
     @order_address.phone_number = "012345678999"
     @order_address.valid?
     expect(@order_address.errors.full_messages).to include("Phone number 11桁にしてください")
    end

    it 'クレジットカード情報は必須であること'do
     @order_address.token = ""
     @order_address.valid?
     expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end


  end
end
