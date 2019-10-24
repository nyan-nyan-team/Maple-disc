
FactoryBot.define do

    # factory :end_user do
    #     sequence(:email) { |n| "example#{n}@test.com" }
    #     sequence(:first_name) { |n| "first_name#{n}" }
    #     sequence(:last_name) { |n| "last_name#{n}" }
    #     sequence(:first_name_kana) { |n| "first_name_kana#{n}" }
    #     sequence(:last_name_kana) { |n| "last_name_kana#{n}" }
    #     sequence(:last_name_kana) { |n| "last_name_kana#{n}" }
    #     sequence(:main_postal_code) {|n| "main_postal_code#{n}" }


    #     trait :no_first_name do
    #         first_name {}
    #     end

    #     trait :no_last_name do
    #         last_name {}
    #     end
    #     trait :no_first_name_kana do
    #         no_first_name_kana {}
    #     end
    #     trait :no_last_name_kana do
    #         no_last_name_kana {}
    #     end
    #     trait :too_short_main_postal_code do
    #         main_postal_code {Faker::Lorem.characters(number: 7)}
    #     end
    # end

    # 稀にカタカナの名前が入るのでコメントアウト
    # first_name = Faker::Japanese::Name.first_name
    # last_name = Faker::Japanese::Name.last_name
    phone = Faker::Number.number(11)
    postal_code = Faker::Number.number(7)
    address = Gimei.address

    factory :end_user do
    # first_name { first_name }    
    # last_name { last_name }    
    # kana_first_name { first_name.yomi }    
    # kana_last_name { last_name.yomi }    
    first_name { "太郎" }    
    last_name { "山田" }    
    kana_first_name { "タロウ" }    
    kana_last_name { "ヤマダ" }    
    phone_number { phone }
    main_postal_code { postal_code }
    main_address { address }
    sequence(:email) { |n| "example@test#{n}.com" }    
    password { "password" }    
    password_confirmation { "password" }    

    trait :create_with_addresses do
        after(:create) do |user|
            create_list(:address, 5, user: user)
        end
    end

    trait :create_with_items do
        after(:create) do |user|
            create_list(:cart_item, 5, user: user, item: create(:item, :create_with_disks))
        end
    end

    trait :create_with_orders do
        after(:create) do |user|
            create_list(:order, 5, user: user)
        end
    end

    end
end



