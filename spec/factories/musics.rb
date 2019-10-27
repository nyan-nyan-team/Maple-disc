FactoryBot.define do
    factory :music do
        sequence(:music_name) { |n| "music_name#{n}" }
        association :disc, factory: :disc
        
        trait :no_music_name do
            music_name{}
        end
    end
end

