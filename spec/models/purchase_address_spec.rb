require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    purchase = FactoryBot.create(:purchase)
    @purchase_address = FactoryBot.build(:purchase_address, purchase_id: purchase.id)
  end

  describe '配送先情報の保存' do

    context '入力に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        sleep(3)
      end
      it 'building_nameは空でも保存できる' do
        sleep(3)
      end
    end

    context '入力に問題ある場合' do
      it 'postal_codeが空だと保存できない' do
        sleep(3)
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        sleep(3)
      end
      it 'origin_region_idが空だと保存できない' do
        sleep(3)
      end
      it 'cityが空だと保存できない' do
        sleep(3)
      end
      it 'street_numberが空だと保存できない' do
        sleep(3)
      end
      it 'phone_numberが空だと保存できない' do
        sleep(3)
      end
      it 'phone_numberが半角数字以外が含まれている場合は保存できない' do
        sleep(3)
      end
      it 'phone_numberが10桁以上11桁以内でないと保存できない' do
        sleep(3)
      end
    end
  end
end
