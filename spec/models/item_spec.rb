require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品の出品' do
    context '商品出品ができるとき' do
      it 'image,item_name,description,category_id,condition_id,postage_id,delivery_area_id,delivery_period_idとpriceが存在すれば保存できる' do
        expect(@item).to be_valid
      end
      it '価格が300円であれば登録できること' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it '価格が9,999,999円であれば登録できること' do
        @item.price = 9999999
        expect(@item).to be_valid
      end
    end

    context '商品出品ができないとき' do
      it '画像を１枚つけなければ登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では登録できないこと' do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品説明が空では登録できないこと' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリー情報が空では登録できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態の情報が空では登録できないこと' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料負担の情報が空では登録できないこと' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end
      it '配送元地域の情報が空では登録できないこと' do
        @item.delivery_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area can't be blank")
      end
      it '配送までの日数の情報が空では登録できないこと' do
        @item.delivery_period_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery period can't be blank")
      end
      it '価格が299円では登録できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '価格が10,000,000円では登録できないこと' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it '価格は半角数値でないと登録できないこと' do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end