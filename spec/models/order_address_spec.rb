require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, id: 123)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入情報の登録' do
    context '商品購入情報が登録できる場合' do
      it 'すべての値が正しく入力されていて、tokenがあれば登録できる' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも登録できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '商品購入情報が登録できない場合' do
      it 'post_codeが空では登録できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Post code can't be blank"
      end
      it 'post_codeは、「3桁ハイフン4桁」でなければ登録できない' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Post code is invalid'
      end
      it 'post_codeは、半角文字列でなければ登録できない' do
        @order_address.post_code = '１２３-４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Post code is invalid'
      end
      it 'prefecture_idが空では登録できない' do
        @order_address.prefecture_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'prefecture_idに「---」が選択されている場合は登録できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'cityが空では登録できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "City can't be blank"
      end
      it 'streetが空では登録できない' do
        @order_address.street = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Street can't be blank"
      end
      it 'phone_numberが空では登録できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'phone_numberは、10桁以上でなければ登録できない' do
        @order_address.phone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone number is invalid'
      end
      it 'phone_numberは、11桁以下でなければ登録できない' do
        @order_address.phone_number = '123456789123'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone number is invalid'
      end
      it 'phone_numberは、半角数値でなければ登録できない' do
        @order_address.phone_number = '０１２３４５６７８９'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone number is invalid'
      end
      it 'tokenが空では登録できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Token can't be blank"
      end
      it 'userが紐付いていないと登録できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "User can't be blank"
      end
      it 'itemが紐付いていないと登録できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end
