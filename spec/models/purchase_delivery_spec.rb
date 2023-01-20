require 'rails_helper'

RSpec.describe PurchaseDelivery, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_delivery = FactoryBot.build(:purchase_delivery, user_id: @user.id, item_id: @item.id)
    sleep(0.1)
  end
  
  describe '商品購入機能単体テスト' do
    context '商品が購入できる場合' do
      it "postcode,prefecture_id,city,address,building,tel,user_id,item_id,tokenが存在すれば購入できる" do
        expect(@purchase_delivery).to be_valid
      end
      it "buildingが空でも購入できる" do
          @purchase_delivery.building = ''
          expect(@purchase_delivery).to be_valid
      end
      it "telが10桁でも購入できる" do
        @purchase_delivery.tel = '1234567890'
        expect(@purchase_delivery).to be_valid
      end
    end
    
    context '商品が購入ができない場合' do
      it "postcodeが空では購入できない" do
        @purchase_delivery.postcode = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Postcode can't be blank")
      end
      it "postcodeが123-456では購入できない" do
        @purchase_delivery.postcode = '123-456'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
      end
      it "prefecture_idが空では購入できない" do
        @purchase_delivery.prefecture_id = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "prefecture_idが1では購入できない" do
        @purchase_delivery.prefecture_id = 1
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "cityが空では購入できない" do
        @purchase_delivery.city = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("City can't be blank")
      end
      it "addressが空では購入できない" do
        @purchase_delivery.address = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Address can't be blank")
      end
      it "telが空では購入できない" do
        @purchase_delivery.tel = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Tel can't be blank")
      end
      it "telが9桁以下では登録できない" do
        @purchase_delivery.tel = '123456789'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Tel is invalid")
      end
      it "telが12桁以上では登録できない" do
        @purchase_delivery.tel = '123456789012'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Tel is invalid")
      end
      it "半角数字以外が含まれている場合、登録できない" do
        @purchase_delivery.tel = 'a123456789'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Tel is invalid")
      end
      it "user_idが空では購入できない" do
        @purchase_delivery.user_id = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("User can't be blank")
      end
      it "user_idが0では購入できない" do
        @purchase_delivery.user_id = 0
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空では購入できない" do
        @purchase_delivery.item_id = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Item can't be blank")
      end
      it "item_idが0では購入できない" do
        @purchase_delivery.item_id = 0
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空では購入できない" do
        @purchase_delivery.token = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
