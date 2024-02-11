require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品を出品できるとき' do
      it 'image、name、description、category_id、condition_id、shipping_fee_paid_by_id、origin_region_id、shipping_day_id、price、user_idが存在すれば保存できる' do
        expect(@item).to be_valid
      end
    end
    context '商品を出品できないとき' do
      it 'nameが空では保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空では保存できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが空では保存できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが空では保存できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'shipping_fee_paid_by_idが空では保存できない' do
        @item.shipping_fee_paid_by_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee paid by can't be blank")
      end
      it 'origin_region_idが空では保存できない' do
        @item.origin_region_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Origin region can't be blank")
      end
      it 'shipping_day_idが空では保存できない' do
        @item.shipping_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it 'priceが空では保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceの値が299以下では保存できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be more than 300 and less than 9999999')
      end
      it 'priceの値が10000000以上では保存できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be more than 300 and less than 9999999')
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
