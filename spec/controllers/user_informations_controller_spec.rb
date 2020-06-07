require 'rails_helper'

describe UserInformationsController do
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
      @user_info = FactoryBot.create(:user_information, {family_name:'山田',first_name: "太郎",family_name_kana: "ヤマダ",first_name_kana: "タロウ",birth:"2020-02-02",postal_code: 123456,state: "東京都",city:"六本木",address_line_1: "1-1",address_line_2: "710",user_id: user.id})
    end

    it "@user_informationに正しい情報が入っていること" do
      get :edit, params: {id: user.id}
      expect(assigns(:user_information)).to eq @user_info
    end

    it "edit.html.hamlに遷移すること" do
      user_information = create(:user_information)
      get :edit, params: {id: user_information}
      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    before do
      login user
    end

    context "保存に成功した場合"  do
      it "user_informationが存在すれば保存される" do
        @user_info = FactoryBot.create(:user_information, {family_name:'山田',first_name: "太郎",family_name_kana: "ヤマダ",first_name_kana: "タロウ",birth:"2020-02-02",postal_code: 123456,state: "東京都",city:"六本木",address_line_1: "1-1",address_line_2: "710",user_id: user.id})
        post :create, params:{user_information: {id: @user_info}}
        expect(build(:user_information)).to be_valid
      end

      it "保存されればマイページトップに戻る" do
          post :create, params:{user_information: attributes_for(:user_information)}
          expect(response).to redirect_to(profiles_path)
      end
    end
  end
end