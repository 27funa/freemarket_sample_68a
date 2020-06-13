# require "rails_helper"

#   describe "ユーザー登録機能", type: :system do
#     describe "新規登録機能" do
#       let(:user) {create(:user)}
#       it "新規登録後トップページに遷移する" do
#         visit new_user_registration_path
#         fill_in "user[nickname]", with: user.nickname
#         fill_in "user[email]", with: user.email
#         fill_in "user[password]", with: user.password
#         fill_in "user[password_confirmation]", with: user.password_confirmation
#         click_button "Sign up"
#         redirect_to root_path
#       end
#     end
#     describe "ログイン機能" do
#       let(:user) {create(:user)}
#       it "ログイン後トップページに遷移する" do
#         visit new_user_session_path
#         fill_in "user[email]", with: user.email
#         fill_in "user[password]", with: user.password
#         click_button "Log in"
#         redirect_to root_path
#       end
#     end
#   end