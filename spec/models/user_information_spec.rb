require 'rails_helper'

RSpec.describe UserInformation, type: :model do
  describe "#create" do
    # 空白確認----------------------------------------------------
    it "family_nameがない場合は登録できないこと" do
      user_information = build(:user_information,family_name: "")
      user_information.valid?
      expect(user_information.errors[:family_name]).to include("を入力してください", "は不正な値です")
    end

    it "first_nameがない場合は登録できないこと" do
      user_information = build(:user_information,first_name: "")
      user_information.valid?
      expect(user_information.errors[:first_name]).to include("を入力してください", "は不正な値です")
    end

    it "family_name_kanaがない場合は登録できないこと" do
      user_information = build(:user_information,family_name_kana: "")
      user_information.valid?
      expect(user_information.errors[:family_name_kana]).to include("を入力してください", "は不正な値です")
    end

    it "first_name_kanaがない場合は登録できないこと" do
      user_information = build(:user_information,first_name_kana: "")
      user_information.valid?
      expect(user_information.errors[:first_name_kana]).to include("を入力してください", "は不正な値です")
    end

    it "birthがない場合は登録できないこと" do
      user_information = build(:user_information,birth: "")
      user_information.valid?
      expect(user_information.errors[:birth]).to include("を入力してください")
    end

    it "postal_codeがない場合は登録できないこと" do
      user_information = build(:user_information,postal_code: "")
      user_information.valid?
      expect(user_information.errors[:postal_code]).to include("を入力してください")
    end

    it "stateがない場合は登録できないこと" do
      user_information = build(:user_information,state: "")
      user_information.valid?
      expect(user_information.errors[:state]).to include("を入力してください")
    end

    it "cityがない場合は登録できないこと" do
      user_information = build(:user_information,city: "")
      user_information.valid?
      expect(user_information.errors[:city]).to include("を入力してください")
    end

    it "address_line_1がない場合は登録できないこと" do
      user_information = build(:user_information,address_line_1: "")
      user_information.valid?
      expect(user_information.errors[:address_line_1]).to include("を入力してください")
    end
    # 入力条件----------------------------------------------------
    it "family_nameが半角の場合は登録できないこと" do
      user_information = build(:user_information,family_name: "ｱｱｱｱ")
      user_information.valid?
      expect(user_information.errors[:family_name]).to include("は不正な値です")
    end

    it "first_nameが半角の場合は登録できないこと" do
      user_information = build(:user_information,first_name: "ｱｱｱｱ")
      user_information.valid?
      expect(user_information.errors[:first_name]).to include("は不正な値です")
    end

    it "family_name_kanaが半角の場合は登録できないこと" do
      user_information = build(:user_information,family_name_kana: "ｱｱｱｱｱ")
      user_information.valid?
      expect(user_information.errors[:family_name_kana]).to include("は不正な値です")
    end

    it "first_name_kanaが半角の場合は登録できないこと" do
      user_information = build(:user_information,first_name_kana: "ｱｱｱｱ")
      user_information.valid?
      expect(user_information.errors[:first_name_kana]).to include("は不正な値です")
    end
  end
end
