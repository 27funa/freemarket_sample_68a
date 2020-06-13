require 'rails_helper'

RSpec.describe DeliveryInformation, type: :model do
  describe "#create" do
    # 空白確認----------------------------------------------------
    it "family_nameがない場合は登録できないこと" do
      delivery_information = build(:delivery_information,family_name: "")
      delivery_information.valid?
      expect(delivery_information.errors[:family_name]).to include("を入力してください", "は不正な値です")
    end

    it "first_nameがない場合は登録できないこと" do
      delivery_information = build(:delivery_information,first_name: "")
      delivery_information.valid?
      expect(delivery_information.errors[:first_name]).to include("を入力してください", "は不正な値です")
    end

    it "family_name_kanaがない場合は登録できないこと" do
      delivery_information = build(:delivery_information,family_name_kana: "")
      delivery_information.valid?
      expect(delivery_information.errors[:family_name_kana]).to include("を入力してください", "は不正な値です")
    end

    it "first_name_kanaがない場合は登録できないこと" do
      delivery_information = build(:delivery_information,first_name_kana: "")
      delivery_information.valid?
      expect(delivery_information.errors[:first_name_kana]).to include("を入力してください", "は不正な値です")
    end

    it "postal_codeがない場合は登録できないこと" do
      delivery_information = build(:delivery_information,postal_code: "")
      delivery_information.valid?
      expect(delivery_information.errors[:postal_code]).to include("を入力してください")
    end

    it "stateがない場合は登録できないこと" do
      delivery_information = build(:delivery_information,state: "")
      delivery_information.valid?
      expect(delivery_information.errors[:state]).to include("を入力してください")
    end

    it "cityがない場合は登録できないこと" do
      delivery_information = build(:delivery_information,city: "")
      delivery_information.valid?
      expect(delivery_information.errors[:city]).to include("を入力してください")
    end

    it "address_line_1がない場合は登録できないこと" do
      delivery_information = build(:delivery_information,address_line_1: "")
      delivery_information.valid?
      expect(delivery_information.errors[:address_line_1]).to include("を入力してください")
    end
    # 入力条件----------------------------------------------------
    it "family_nameが半角の場合は登録できないこと" do
      delivery_information = build(:delivery_information,family_name: "ｱｱｱｱ")
      delivery_information.valid?
      expect(delivery_information.errors[:family_name]).to include("は不正な値です")
    end

    it "first_nameが半角の場合は登録できないこと" do
      delivery_information = build(:delivery_information,first_name: "ｱｱｱｱ")
      delivery_information.valid?
      expect(delivery_information.errors[:first_name]).to include("は不正な値です")
    end

    it "family_name_kanaが半角の場合は登録できないこと" do
      delivery_information = build(:delivery_information,family_name_kana: "ｱｱｱｱｱ")
      delivery_information.valid?
      expect(delivery_information.errors[:family_name_kana]).to include("は不正な値です")
    end

    it "first_name_kanaが半角の場合は登録できないこと" do
      delivery_information = build(:delivery_information,first_name_kana: "ｱｱｱｱ")
      delivery_information.valid?
      expect(delivery_information.errors[:first_name_kana]).to include("は不正な値です")
    end
  end
end
