FactoryBot.define do
    factory :address do
        sequence(:delivery_name) { |n| "delivery_name#{n}" }
        sequence(:delivery_postal_code) { |n| "delivery_postal_code#{n}" }
        sequence(:delivery_address) { |n| "delivery_address#{n}" }
        association :end_user, factory: :end_user

        trait :no_delivery_name do
            delivery_name{}
        end

        trait :no_delivery_postal_code do
            delivery_postal_code{}
        end
        trait :no_delivery_address do
            delivery_address{}
        end
    end
end

