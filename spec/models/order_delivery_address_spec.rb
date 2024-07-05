require 'rails_helper'

RSpec.describe OrderDeliveryAddress, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @order_delivery_address = FactoryBot.build(:order_delivery_address, user_id: @user.id, item_id: @item.id)
  end

  describe '購入情報の保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_delivery_address).to be_valid
      end

      it 'building_nameは空でも保存できること' do
        @order_delivery_address.building_name = ''
        expect(@order_delivery_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_delivery_address.postal_code = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_delivery_address.postal_code = '1234567'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'postal_codeが半角数字でなければ保存できないこと' do
        @order_delivery_address.postal_code = '１２３ー４５６７'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'prefecture_idが0だと保存できないこと' do
        @order_delivery_address.prefecture_id = 0
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'municipalityが空だと保存できないこと' do
        @order_delivery_address.municipality = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'house_addressが空だと保存できないこと' do
        @order_delivery_address.house_address = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("House address can't be blank")
      end

      it 'phone_numberが空だと保存できないこと' do
        @order_delivery_address.phone_number = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが9桁以下だと保存できないこと' do
        @order_delivery_address.phone_number = '123456789'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include('Phone number is too short')
      end

      it 'phone_numberが12桁以上だと保存できないこと' do
        @order_delivery_address.phone_number = '123456789101'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include('Phone number is invalid. Input only number')
      end

      it '電話番号に半角数字以外が含まれている場合は保存できないこと' do
        @order_delivery_address.phone_number = '１２３４５６７８９１０'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include('Phone number is invalid. Input only number')
      end

      it 'userが紐付いていないと保存できないこと' do
        @order_delivery_address.user_id = nil
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていないと保存できないこと' do
        @order_delivery_address.item_id = nil
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では保存できないこと' do
        @order_delivery_address.token = nil
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
