require 'rails_helper'

RSpec.describe Item, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end




    it '商品画像を1枚つけることが必須であること'do 
     @item.image = nil
     @item.valid?
     expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が必須であること'do
     @item.name = ""
     @item.valid?
     expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明が必須であること'do
     @item.product_description = ""
     @item.valid?
     expect(@item.errors.full_messages).to include("Product description can't be blank")
    end

    it 'カテゴリーの情報が必須であること'do
     @item.category_id = ""
     @item.valid?
     expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it '商品の状態についての情報が必須であること'do
     @item.product_condition_id = ""
     @item.valid?
     expect(@item.errors.full_messages).to include("Product condition can't be blank")
    end

    it '配送料の負担についての情報が必須であること'do
     @item.shipping_charges_id = ""
     @item.valid?
     expect(@item.errors.full_messages).to include("Shipping charges can't be blank")
    end

    it '発送元の地域についての情報が必須であること'do
      @item.shipping_area_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area can't be blank")
    end

    it '発送までの日数についての情報が必須であること'do
      @item.estimated_shipping_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Estimated shipping can't be blank")
    end

    it '価格についての情報が必須であること'do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end

    it '販売価格は半角数字のみ保存可能であること'do
      @item.price = "１１１１１１"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end

    it '価格の範囲が、¥300以上であること'do
      @item.price = "¥299"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end

    it '価格の範囲が、¥9999999未満であること'do
      @item.price = "¥10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end
  end
end



