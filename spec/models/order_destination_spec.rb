require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_destination = FactoryBot.build(:order_destination, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '配送先情報の保存' do
    context '内容に問題がない場合' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@order_destination).to be_valid
      end
      it 'buildingが空でも保存できる' do
        @order_destination.building = ''
        expect(@order_destination).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'user_idが紐付いてないと保存できない' do
        @order_destination.user_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが紐付いてないと保存できない' do
        @order_destination.item_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Item can't be blank")
      end
      it 'postcodeが空だと保存できない' do
        @order_destination.postcode = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postcodeのハイフンがないと保存できない' do
        @order_destination.postcode = '1234567'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Postcode is Invalid. Include hyphen(-)')
      end
      it 'prefecture_idが -- だと保存できない' do
        @order_destination.prefecture_id = 1
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが空だと登録できない' do
        @order_destination.prefecture_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalitiesが空だと登録できない' do
        @order_destination.municipalities = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空だと登録できない' do
        @order_destination.address = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと登録できない' do
        @order_destination.phone_number = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10桁以上11桁以下でない場合は保存できない' do
        @order_destination.phone_number = '000000000000'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberにハイフンが入っていると保村できない' do
        @order_destination.phone_number = '123-4567-7890'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenが空だと登録できない' do
        @order_destination.token = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
