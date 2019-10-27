FactoryBot.define do
    factory :product do
        sequence(:title) { |n| "title#{n}" }
        sequence(:explanation) { |n| "explanation#{n}" }
        sequence(:amount) { |n| "amount#{n}" }

        association :label, factory: :label
        association :artist, factory: :artist
        association :genre, factory: :genre

        trait :no_title do
            title{}
        end

        trait :no_explanation do
            explanation{}
        end

        trait :no_amount do
            amount{}
        end
    

    end
end
