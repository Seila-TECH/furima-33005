require 'rails_helper'

RSpec.describe Form, type: :model do
  before do
    @form = FactoryBot.build(:form)
  end

  describe "商品購入" do
    context '商品購入ができるとき' do
      it "postal,shipping_erea_id,adress,adress_number,telphone_number,tokenが存在すれば購入できる" do
        expect(@form).to be_valid
      end

      it "telphone_numberが11桁以内、且つで半角数字のみであれば購入できる" do
        @form.telphone_number = "12345678901"
      expect(@form).to be_valid
      end
    end

    context '商品購入ができないとき' do
      it "postalが空では購入できない" do
        @form.postal = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Postal can't be blank")
      end

      it "shipping_erea_idが空では購入できない" do
        @form.shipping_erea_id = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Shipping erea can't be blank")
      end

      it "adressが空では購入できない" do
        @form.adress = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Adress can't be blank")
      end

      it "adress_numberが空では購入できない" do
        @form.adress_number = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Adress number can't be blank")
      end

      it "telphone_numberが空では購入できない" do
        @form.telphone_number = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Telphone number can't be blank")
      end

      it "postalが半角のハイフンを含んだ正しい形式でないと購入できない" do
        @form.postal = '1234567'
        @form.valid?
        expect(@form.errors.full_messages).to include("Postal is invalid")
      end

      it "shipping_erea_idが１であれば購入できない" do
        @form.shipping_erea_id = 1
        @form.valid?
        expect(@form.errors.full_messages).to include("Shipping erea Select")
      end

      it "telphone_numberが11桁より大きいと購入できない" do
        @form.telphone_number = "123456789012"
        @form.valid?
        expect(@form.errors.full_messages).to include("Telphone number is invalid")
      end

      it "tokenが空であれば購入できない" do
        @form.token = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
