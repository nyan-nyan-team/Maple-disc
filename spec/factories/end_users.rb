
FactoryBot.define do
    factory :end_user do
        sequence(:email) { |n| "example#{n}@test.com" }
        sequence(:first_name) { |n| "first_name#{n}" }
        sequence(:last_name) { |n| "last_name#{n}" }
        sequence(:first_name_kana) { |n| "first_name_kana#{n}" }
        sequence(:last_name_kana) { |n| "last_name_kana#{n}" }
        sequence(:main_postal_code) {|n| "main_postal_code#{n}" }


        trait :no_first_name do
            first_name{}
        end

        trait :no_last_name do
            last_name{}
        end
        trait :no_first_name_kana do
            first_name_kana{}
        end
        trait :no_last_name_kana do
            last_name_kana{}
        end
        trait :too_short_main_postal_code do
            main_postal_code {Faker::Lorem.characters(number: 7)}
        end
    end
end



