

require 'rails_helper'
require "refile/file_double"

RSpec.describe EndUser, "モデルに関するテスト", type: :model do
    describe 'アソシエーション' do
        it "Addressモデルを複数持っている" do
            is_expected.to have_many(:addresses)
        end
        it "Orderモデルを複数持っている" do
            is_expected.to have_many(:orders)
        end
        it "CartProductモデルを複数持っている" do
            is_expected.to have_many(:cart_products)
        end
    end

    describe 'バリデーションチェック' do
        context "保存できない場合" do
            it "first_nameが空欄" do
                expect(build(:end_user, :no_first_name)).to_not be_valid
            end
            it "last_nameが空欄" do
                expect(build(:end_user, :no_last_name)).to_not be_valid
            end
            it "first_name_kanaが空欄" do
                expect(build(:end_user, :no_first_name_kana)).to_not be_valid
            end
            it "last_name_kanaが空欄" do
                expect(build(:end_user, :no_last_name_kana)).to_not be_valid
            end
            it "main_postal_codeが空欄" do
                expect(build(:end_user, :no_main_postal_code)).to_not be_valid
            end
        end
    end
end

