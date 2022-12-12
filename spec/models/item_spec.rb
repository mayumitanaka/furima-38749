require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品情報の登録' do
    context '商品出品情報が登録できる場合' do
      it 'item_name、item_info、item_price、item_category_id、item_status_id、shipping_fee_status_id、prefecture_id、scheduled_delivery_id、imageが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品情報が登録できない場合' do
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it 'item_infoが空では登録できない' do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item info can't be blank"
      end
      it 'item_priceが空では登録できない' do
        @item.item_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price can't be blank"
      end
      it 'item_priceには英字は登録できない' do
        @item.item_price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price is not a number"
      end
      it 'item_priceには全角文字は登録できない' do
        @item.item_price = '三百'
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price is not a number"
      end
      it 'item_priceには全角数字は登録できない' do
        @item.item_price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price is not a number"
      end
      it 'item_priceが299以下では登録できない' do
        @item.item_price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price must be greater than or equal to 300"
      end
      it 'item_priceが10000000以上では登録できない' do
        @item.item_price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price must be less than or equal to 9999999"
      end
      it 'item_category_idが空では登録できない' do
        @item.item_category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Item category can't be blank"
      end
      it 'item_status_idが空では登録できない' do
        @item.item_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Item status can't be blank"
      end
      it 'shipping_fee_status_idが空では登録できない' do
        @item.shipping_fee_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping fee status can't be blank"
      end
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'scheduled_delivery_idが空では登録できない' do
        @item.scheduled_delivery_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Scheduled delivery can't be blank"
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
    end
  end
end