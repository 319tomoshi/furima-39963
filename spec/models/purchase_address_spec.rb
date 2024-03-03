require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    purchase = FactoryBot.create(:purchase)
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, purchase_id: purchase.id, user_id: user.id, item_id: item.id)
  end

  describe '配送先情報の保存' do

    context '入力に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@purchase_address).to be_valid
      end
      it 'building_nameは空でも保存できる' do
        @purchase_address.building_name = ''
        sleep(1)
        expect(@purchase_address).to be_valid
      end
    end

    context '入力に問題ある場合' do
      it 'postal_codeが空だと保存できない' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        sleep(1)
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        sleep(1)
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'origin_region_idが空だと保存できない' do
        @purchase_address.origin_region_id = '1'
        @purchase_address.valid?
        sleep(1)
        expect(@purchase_address.errors.full_messages).to include("Origin region can't be blank")
      end
      it 'cityが空だと保存できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        sleep(1)
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it 'street_numberが空だと保存できない' do
        @purchase_address.street_number = ''
        @purchase_address.valid?
        sleep(1)
        expect(@purchase_address.errors.full_messages).to include("Street number can't be blank")
      end
      it 'phone_numberが空だと保存できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        sleep(1)
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが半角数字以外が含まれている場合は保存できない' do
        @purchase_address.phone_number = '０７０１２３４５６７８'
        @purchase_address.valid?
        sleep(1)
        expect(@purchase_address.errors.full_messages).to include("Phone number must be an integer")
      end
      it 'phone_numberが10桁以上11桁以内でないと保存できない' do
        @purchase_address.phone_number = '070123456789'
        @purchase_address.valid?
        sleep(1)
        expect(@purchase_address.errors.full_messages).to include("Phone number must be 10 to 11 digits")
      end
      it 'tokenが空では保存できない' do
        @purchase_address.token = nil
        @purchase_address.valid?
        sleep(1)
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
