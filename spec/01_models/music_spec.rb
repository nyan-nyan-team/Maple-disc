require 'rails_helper'
RSpec.describe Music, "モデルに関するテスト", type: :model do
    describe 'アソシエーション' do
        it "discモデルに属している" do
            is_expected.to belong_to(:disc)
        end
    
        describe 'バリデーションチェック' do
            context "保存できない場合" do
                it "music_nameが空欄" do
                    expect(build(:music, :no_music_name)).to_not be_valid
                end
            end
        end
    end
end

