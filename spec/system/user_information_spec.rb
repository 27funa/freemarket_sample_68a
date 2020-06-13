# require "rails_helper"

#   describe "user_information", type: :system do
#     let(:user) {FactoryBot.create(:user,nickname:"test",email:"test@com")}

#     before do
#       visit new_user_session_path
#       fill_in "user[email]", with: user.email
#       fill_in "user[password]", with: user.password
#       click_button "Log in"
#     end

#     describe "本人情報登録" do
#       it "本人情報を登録後にマイページトップに遷移する" do
#         visit new_user_information_path
#         @user_info = FactoryBot.create(:user_information, {family_name:'山田',first_name: "太郎",family_name_kana: "ヤマダ",first_name_kana: "タロウ",birth:"2020-02-02",postal_code: 123456,state: "東京都",city:"六本木",address_line_1: "1-1",address_line_2: "710",user_id: user.id})
#         click_button "登録する"
#         redirect_to profiles_path
#       end
#       # 本人情報のシステムテストはまだ途中
#       # it "本人情報が登録済ならば編集アクションに遷移する" do
#       #   @user_info = FactoryBot.create(:user_information, {family_name:'山田',first_name: "太郎",family_name_kana: "ヤマダ",first_name_kana: "タロウ",birth:"2020-02-02",postal_code: 123456,state: "東京都",city:"六本木",address_line_1: "1-1",address_line_2: "710",user_id: user.id})
#       #   visit edit_user_informations_path(@user_info)

#       # end
#     end
#   end
