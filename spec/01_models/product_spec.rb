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
    


    describe '実際に保存してみる' do
        context '保存できる場合' do

            it "label_idを入れて保存" do
                label = create(:label)
                expect(create(:product, label_id: label.id)).to be_valid
            end
            it "genre_idを入れて保存" do
                genre = create(:genre)
                expect(create(:product, genre_id: genre.id)).to be_valid
            end
            it "artist_idを入れて保存" do
                artist = create(:artist)
                expect(create(:product, artist_id: artist.id)).to be_valid
            end
        end
        context '保存できない場合' do
            
            it "titleが空欄" do
                expect(build(:product, :no_title)).to_not be_valid
            end
            it "explanationが空欄" do
                expect(build(:product, :no_explanation)).to_not be_valid
            end
            it "amountが空欄" do
                expect(build(:product, :no_amount)).to_not be_valid
            end
        end
    end
    
end