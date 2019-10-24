require 'rails_helper'

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
end