require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品情報の登録' do
    context '商品出品情報が登録できる場合' do
      it 'item_name、item_info、item_price、item_category_id、item_status_id、shipping_fee_status_id
          prefecture_id、scheduled_delivery_id、imageが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品情報が登録できない場合' do
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include '商品名を入力してください'
      end
      it 'item_infoが空では登録できない' do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include '商品の説明を入力してください'
      end
      it 'item_priceが空では登録できない' do
        @item.item_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include '価格を入力してください'
      end
      it 'item_priceには英字は登録できない' do
        @item.item_price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include '価格は数値で入力してください'
      end
      it 'item_priceには全角文字は登録できない' do
        @item.item_price = '三百'
        @item.valid?
        expect(@item.errors.full_messages).to include '価格は数値で入力してください'
      end
      it 'item_priceには全角数字は登録できない' do
        @item.item_price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include '価格は数値で入力してください'
      end
      it 'item_priceが299以下では登録できない' do
        @item.item_price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include '価格は300以上の値にしてください'
      end
      it 'item_priceが10000000以上では登録できない' do
        @item.item_price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include '価格は9999999以下の値にしてください'
      end
      it 'item_category_idが空では登録できない' do
        @item.item_category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'カテゴリーを入力してください'
      end
      it 'item_category_idに「---」が選択されている場合は登録できない' do
        @item.item_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'カテゴリーを入力してください'
      end
      it 'item_status_idが空では登録できない' do
        @item.item_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include '商品の状態を入力してください'
      end
      it 'item_status_idに「---」が選択されている場合は登録できない' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include '商品の状態を入力してください'
      end
      it 'shipping_fee_status_idが空では登録できない' do
        @item.shipping_fee_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include '配送料の負担を入力してください'
      end
      it 'shipping_fee_status_idに「---」が選択されている場合は登録できない' do
        @item.shipping_fee_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include '配送料の負担を入力してください'
      end
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include '発送元の地域を入力してください'
      end
      it 'prefecture_idに「---」が選択されている場合は登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include '発送元の地域を入力してください'
      end
      it 'scheduled_delivery_idが空では登録できない' do
        @item.scheduled_delivery_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include '発送までの日数を入力してください'
      end
      it 'scheduled_delivery_idに「---」が選択されている場合は登録できない' do
        @item.scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include '発送までの日数を入力してください'
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'Userを入力してください'
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include '画像を入力してください'
      end
    end
  end
end
