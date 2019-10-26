FactoryBot.define do
    factory :artist do
        sequence(:artist_name) { |n| "artist_name#{n}" }

        trait :no_artist_name do
            artist_name{}
        end

        trait :create_with_products do
            after(:create) do |artist|
            create_list(:product, 3, artist: artist)
            end
        end

    end
end