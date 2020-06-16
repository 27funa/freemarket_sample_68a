# require "rails_helper"

#   describe "マイページボタン", type: :system do
#     describe "マイページボタンの存在有無" do
#       let(:user) {create(:user)}

#       it "ログイン前はマイページボタンはない" do
#         visit root_path
#         expect(page).to have_no_content("マイページ")
#       end
      
#       it "ログイン後はマイページボタンが存在する" do
#         visit new_user_session_path
#         fill_in "user[email]", with: user.email
#         fill_in "user[password]", with: user.password
#         click_button "Log in"
#         redirect_to root_path
#         expect(page).to have_content("マイページ")
#       end
#     end
#   end

