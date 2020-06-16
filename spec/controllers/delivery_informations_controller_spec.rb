require 'rails_helper'

describe DeliveryInformationsController do
  let(:user) {create(:user)}

  describe 'GET #new' do
    before do
      login user
    end

    it "new.html.hamlに遷移すること" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    before do
      login user
      @deli_info = FactoryBot.create(:delivery_information, {family_name:'山田',first_name: "太郎",family_name_kana: "ヤマダ",first_name_kana: "タロウ",postal_code: 123456,state: "東京都",city:"六本木",address_line_1: "1-1",address_line_2: "710",user_id: user.id})
    end

    it "@delivery_informationに正しい情報が入っていること" do
      get :edit, params: {id: user.id}
      expect(assigns(:delivery_information)).to eq @deli_info
    end

    it "edit.html.hamlに遷移すること" do
      delivery_information = create(:delivery_information)
      get :edit, params: {id: delivery_information}
      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    before do
      login user
    end

    context "保存に成功した場合"  do
      it "delivery_informationが存在すれば保存される" do
        @deli_info = FactoryBot.create(:delivery_information, {family_name:'山田',first_name: "太郎",family_name_kana: "ヤマダ",first_name_kana: "タロウ",postal_code: 123456,state: "東京都",city:"六本木",address_line_1: "1-1",address_line_2: "710",user_id: user.id})
        post :create, params:{delivery_information: {id: @deli_info}}
        expect(build(:delivery_information)).to be_valid
      end

      it "保存されればマイページトップに戻る" do
          post :create, params:{delivery_information: attributes_for(:delivery_information)}
          expect(response).to redirect_to(profiles_path)
      end
    end

  end
  describe "PATCH #update" do
    before do
      login user
    end
    it "更新される" do
      @deli_info_update = FactoryBot.create(:delivery_information, user: user)
      patch :update, params:{id: @deli_info_update.id, delivery_information: attributes_for(:delivery_information, first_name: "田中")}
      expect(user.delivery_information.reload.first_name).to eq "田中"
    end

    it "更新した場合マイページトップに戻る" do
      @deli_info_update = FactoryBot.create(:delivery_information, user: user)
      patch :update, params:{id: @deli_info_update.id, delivery_information: attributes_for(:delivery_information, first_name: "田中")}
      expect(response).to redirect_to(profiles_path)
    end
  end
  
end