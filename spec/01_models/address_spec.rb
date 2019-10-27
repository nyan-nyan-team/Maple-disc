require 'rails_helper'
RSpec.describe Address, "モデルに関するテスト", type: :model do
    describe 'アソシエーション' do
        it "end_userモデルに属している" do
            is_expected.to belong_to(:end_user)
        end
    end

    describe 'バリデーションチェック' do
        context "保存できない場合" do
            it "delivery_nameが空欄" do
                expect(build(:address, :no_delivery_name)).to_not be_valid
            end
            it "delivery_postal_codeが空欄" do
                expect(build(:address, :no_delivery_postal_code)).to_not be_valid
            end
            it "delivery_addressが空欄" do
                expect(build(:address, :no_delivery_address)).to_not be_valid
            end


        end
    end
end