require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品' do
    context '商品を出品できるとき' do
      it 'name、description、category_id、condition_id、shipping_fee_paid_by_id、origin_region_id、shipping_day_id、price、userが存在すれば出品できる' do
      end
    end
    context '商品を出品できないとき' do
      it 'nameが空では出品できない' do
      end
      it 'descriptionが空では出品できない' do
      end
      it 'category_idが空では出品できない' do
      end
      it 'condition_idが空では出品できない' do
      end
      it 'shipping_fee_paid_by_idが空では出品できない' do
      end
      it 'origin_region_idが空では出品できない' do
      end
      it 'shipping_day_idが空では出品できない' do
      end
      it 'priceが空では出品できない' do
      end
      it 'userが空では出品できない' do
      end
    end
  end
end
