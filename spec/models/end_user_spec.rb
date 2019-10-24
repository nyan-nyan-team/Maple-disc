

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
        end
    end

    describe '実際に保存してみる' do
        context "保存できない場合" do
            it "first_nameが空欄" do
                expect(FactoryBot.create(:end_user, :no_farst_name)).to_not be_valid
            end
            it "last_nameが空欄" do
                expect(FactoryBot.create(:end_user, :no_last_name)).to_not be_valid
            end
            it "first_name_kanaが空欄" do
                expect(FactoryBot.create(:end_user, :no_farst_name_kana)).to_not be_valid
            end
            it "last_name_kanaが空欄" do
                expect(FactoryBot.create(:end_user, :no_last_name_kana)).to_not be_valid
            end
            it "main_postal_codeが7文字以下" do
                expect(FactoryBot.create(:end_user, :no_main_postal_code)).to_not be_valid
            end
        end
    end
end

