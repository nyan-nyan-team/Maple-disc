FactoryBot.define do
    factory :product do
        association :artist
        association :label
        association :genre
    end
end
