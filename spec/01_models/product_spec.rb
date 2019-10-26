require 'rails_helper'
require "refile/file_double"


RSpec.describe Product, "モデルに関するテスト", type: :model do
    describe 'アソシエーション' do
        it "OrderDetailモデルを複数持っている" do
            is_expected.to have_many(:order_details)
        end
        it "Discモデルを複数持っている" do
            is_expected.to have_many(:discs)
        end
        it "Arrivalモデルを複数持っている" do
            is_expected.to have_many(:arrivals)
        end
        it "Labelモデルに属している" do
            is_expected.to belong_to(:label)
        end
        it "Genreモデルに属している" do
            is_expected.to belong_to(:genre)
        end
        it "Artistモデルに属している" do
            is_expected.to belong_to(:artist)
        end
    end
    


    context 'バリデーションテェック' do
            it "titleが空欄" do
                product = Product.new(title: '', explanation:'hoge' )
                expect(product).to be_invalid
                expect(product.errors[:title]).to include("can't be blank")

            end
            it "explanationが空欄" do
                product = Product.new(title: 'hoge', explanation: '')
                expect(product).to be_invalid
                expect(product.errors[:explanation]).to include("can't be blank")
            end
            # it "amountが空欄" do
            #     expect(FactoryBot.build(:product, :amount)).to_not be_valid
            # end
            # it "画像データなし" do
            #     expect(FactoryBot.create(:product)).to be_valid
            # end



    end
    
end