require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.build(:user)
      item = FactoryBot.build(:item)
      @buy_address = FactoryBot.build(:buy_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buy_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @buy_address.building_name = ''
        expect(@buy_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'delivery_area_idを選択していないと保存できないこと' do
        @buy_address.delivery_area_id = 0
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Delivery area can't be blank")
      end

      it 'postal_codeが空だと保存できないこと' do
        @buy_address.postal_code = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @buy_address.postal_code = '1234567'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'postal_codeが全角では保存できないこと' do
        @buy_address.postal_code = '１２３-４５６７'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      
      it 'cityが空だと保存できないこと' do
        @buy_address.city = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("City can't be blank")
      end

      it 'address_lineが空だと保存できないこと' do
        @buy_address.address_line = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Address line can't be blank")
      end

      it 'phone_numberが空だと保存できないこと' do
        @buy_address.phone_number = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが9桁だと保存できないこと' do
        @buy_address.phone_number = '123456789'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number is invalid.")
      end

      it 'phone_numberが12桁だと保存できないこと' do
        @buy_address.phone_number = '012345678901'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number is invalid.")
      end
    end
  end
end
