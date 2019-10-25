FactoryBot.define do


    factory :product do
        sequence(:title) { |n| "title#{n}" }
        sequence(:explanation) { |n| "product#{n}" }
        end
    end
