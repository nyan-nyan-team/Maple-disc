require 'rails_helper'

RSpec.describe Artist, "モデルに関するテスト", type: :model do
    describe 'アソシエーション' do
        it "Productモデルを複数持っている" do
            is_expected.to have_many(:products)
        end
    end

    describe 'バリデーションチェック' do
        context "保存できない場合" do
            it "artist_nameが空欄" do
                expect(build(:artist, :no_artist_name)).to_not be_valid
            end
        end
    end
end
