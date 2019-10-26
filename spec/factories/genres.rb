FactoryBot.define do
    factory :genre do
        sequence(:genre_name) { |n| "genre_name#{n}" }

        trait :no_genre_name do
            genre_name{}
        end

        trait :create_with_products do
            after(:create) do |genre|
            create_list(:product, 3, genre: genre)
            end
        end


    end
end