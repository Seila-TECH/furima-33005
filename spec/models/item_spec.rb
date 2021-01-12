require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品登録" do
    context '商品出品登録ができるとき' do
      it "image、item_nameとitem_profile、category_id、item_status_id、shipping_fee_id、shipping_erae_id、shipping_date_id、priceが存在すれば登録できる" do
        expect(@item).to be_valid
      end

      it "priceが半角数字のみであれば登録できる" do
        @item.price = "123456"
        expect(@item).to be_valid
      end
    
      it"priceが300だと登録できる" do
        @item.price = 300
        expect(@item).to be_valid
      end
    end

    context '商品出品登録ができないとき' do
      it "imageが空では登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    
      it "item_nameが空では登録できない" do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it "item_profileが空では登録できない" do
        @item.item_profile = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item profile can't be blank")
      end

      it "category_idが空では登録できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "item_status_idが空では登録できない" do
        @item.item_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank")
      end

      it "shipping_fee_idが空では登録できない" do
        @item.shipping_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end

      it "shipping_erea_idが空では登録できない" do
        @item.shipping_erea_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping erea can't be blank")
      end

      it "shipping_date_idが空では登録できない" do
        @item.shipping_date_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end

      it "priceが空では登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "紐づくユーザーが保存しないと保存できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end

      it "category_idに１であれば登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it "item_status_idに１であれば登録できない" do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status Select")
      end
      it "shipping_fee_idに１であれば登録できない" do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee Select")
      end
      it "shipping_erea_idに１であれば登録できない" do
        @item.shipping_erea_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping erea Select")
      end
      it "shipping_date_idに１であれば登録できない" do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date Select")
      end

      it "priceが半角数字のみでなければ登録できない" do
        @item.price = "１２３456"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it"priceが299だと登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      
      it"priceが10000000だと登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end
    end
  end




end
