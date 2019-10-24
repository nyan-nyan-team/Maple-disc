

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
            it "passwordが空欄" do
                expect(FactoryBot.build(:end_user, :no_password)).to_not be_vaild
            end
        end
    end
end

