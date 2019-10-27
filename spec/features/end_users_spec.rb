# require 'rails_helper'

# RSpec.feature "EndUsers", type: :feature do
# given!(:end_user1) { create(:end_user) }

# feature "admin" do
#     given(:admin) { create(:admin) }
#     given!(:end_user2) { create(:end_user) }
#     given!(:end_user3) { create(:end_user) }

#     background do
#         admin_login_as admin
#     end

#     scenario "look show page via index page" do
#         visit admins_end_users_path
#         expect(page).to have_content "ユーザー一覧"
#         expect(page).to have_content end_user1.last_name
#         expect(page).to have_content end_user1.first_name
#         expect(page).to have_content end_user2.last_name
#         expect(page).to have_content end_user2.first_name
#         expect(page).to have_content end_user3.last_name
#         expect(page).to have_content end_user3.first_name
#         click_link "詳細", href: admins_end_user_path(end_user1)
#         expect(page).to have_current_path admins_end_user_path(end_user1)
#         expect(page).to have_content end_user1.last_name
#         expect(page).to have_content end_user1.first_name
#         expect(page).to have_content end_user1.last_name_kana
#         expect(page).to have_content end_user1.first_name_kanakana_full_name
#         expect(page).to have_content end_user1.main_postal_code
#         expect(page).to have_content end_user1.main_address
#         expect(page).to have_content end_user1.phone_number
#         expect(page).to have_content end_user1.email
#     end

#     scenario "edit end_user informations" do
#         visit edit_admins_end_user_path(end_user1)
#         fill_in "end_user_last_name", with: "山本"
#         fill_in "end_user_first_name", with: "三郎"
#         fill_in "end_user_kana_last_name", with: "ヤマモト"
#         fill_in "end_user_kana_first_name", with: "サブロウ"
#         fill_in "郵便番号", with: "00110210"
#         fill_in "住所", with: "東京都渋谷区0000-0000"
#         fill_in "電話番号", with: "00110210000"
#         fill_in "メールアドレス", with: "example@feature.com"
#         click_button "保存"
#         expect(page).to have_content "ユーザー情報を編集しました"
#         expect(page).to have_content "山本 三郎"
#         expect(page).to have_content "ヤマモト サブロウ"
#         expect(page).to have_content "00110210"
#         expect(page).to have_content "東京都 渋谷区 0000-0000"
#         expect(page).to have_content "00110210000"
#         expect(page).to have_content "example@feature.com"
#     end

#     scenario "destroy end_user" do
#         visit admins_end_user_path(end_user1)
#             expect(end_user1.deleted_at).to be_empty
#             click_link "削除"
#             expext(page).to out_path
#             expect(page).to have_content ""
#             expect(end_user1.deleted_at).to_not be_empty
#     end

# end

# feature "end_user" do

#     background do
#         end_user_login_as end_user1
#     end

#     scenario "look show page" do
#         visit end_users_users_path
#         expect(page).to have_content end_user1.last_name
#         expect(page).to have_content end_user1.first_name
#         expect(page).to have_content end_user1.last_name_kana
#         expect(page).to have_content end_user1.first_name_kana
#         expect(page).to have_content end_user1.main_postal_code
#         expect(page).to have_content end_user1.main_address
#         expect(page).to have_content end_user1.phone_number
#         expect(page).to have_content end_user1.email
#     end

#     scenario "edit end_user informations" do
#         visit edit_end_users_users_path 
#         fill_in "end_user_last_name", with: "山本"
#         fill_in "end_end_user_first_name", with: "三郎"
#         fill_in "end_user_kana_last_name", with: "ヤマモト"
#         fill_in "end_user_kana_first_name", with: "サブロウ"
#         fill_in "郵便番号", with: "00110210"
#         fill_in "住所", with: "東京都渋谷区0000-0000"
#         fill_in "電話番号", with: "00110210000"
#         fill_in "メールアドレス", with: "example@feature.com"
#         click_button "保存"
#         expect(page).to have_content "ユーザー情報を編集しました"
#         expect(page).to have_content "山本 三郎"
#         expect(page).to have_content "ヤマモト サブロウ"
#         expect(page).to have_content "00110210"
#         expect(page).to have_content "東京都 渋谷区 0000-0000"
#         expect(page).to have_content "00110210000"
#         expect(page).to have_content "example@feature.com"
#     end

#     scenario "unsubscribe" do
#         visit end_users_users_path
#         expect(page).to have_content "ようこそ#{end_user1.full_name}さん"
#         click_link "退会"
#         expect(page).to have_current_path unsubscribe_confirm_end_users_users_path
#         expect(page).to have_link "Top"
#         expect(page).to have_link "退会"
#         click_link "退会"
#         expect(page).to have_current_path root_path
#         expect(page).to have_content "退会しました"
#         expect(page).to_not have_content "ようこそ、#{end_user1.first_name}さん"
#         visit new_end_user_session_path
#         fill_in "メールアドレス", with: end_user1.email
#         fill_in "パスワード", with: end_user1.password
#         click_button "Log in"
#         expect(page).to have_content "退会したユーザーのメールアドレスです"
#         expect(page).to_not have_content "ようこそ#{end_user1.full_name}さん"
#     end
#     end
# end
