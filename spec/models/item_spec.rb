require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品ができる場合' do
      it "name,content,categoty_id,status_id,deliveryfee_type_id,prefecture_id,delivery_when_id,user,imageが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '商品出品できない場合' do
      it "nameが空では出品できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "imageが空では登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "contentが空では登録できない" do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end
      it "category_idが空では登録できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "status_idが空では登録できない" do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it "deliveryfee_type_idが空では登録できない" do
        @item.deliveryfee_type_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliveryfee type can't be blank")
      end
      it "prefecture_idが空では登録できない" do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "delivery_when_idが空では登録できない" do
        @item.delivery_when_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery when can't be blank")
      end
      it "itemfeeが空では登録できない" do
        @item.itemfee = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Itemfee can't be blank")
      end
      it "itemfeeが半角数値意外では登録できない" do
        @item.itemfee = '１００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Itemfee is not a number")
      end
      it "itemfeeが300未満では登録できない" do
        @item.itemfee = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Itemfee must be greater than or equal to 300")
      end
      it "itemfeeが9999999以上では登録できない" do
        @item.itemfee = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Itemfee must be less than or equal to 9999999")
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end

