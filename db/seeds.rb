# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Artist.create!(
    [
        {
            artist_name: '加藤ミリヤ'
        },
        {
            artist_name: '米酢げんし'
        }
    ]
)

Genre.create!(
    [
        {
            genre_name: 'POP'
        },
        {
            genre_name: 'POP'
        }
    ]
)

Label.create!(
    [
        {
            label_name: 'avex'
        },
        {
            label_name: 'sony music'
        }
    ]
)

Product.create!(
    [
        {
            artist_id: 1,
            genre_id: 1,
            label_id: 1,
            title: 'このままずっと朝まで',
            amount: 1500,
            status: 1,
            release: '発売日だよ',
            explanation: '曲の説明とか'
        },
        {
            artist_id: 2,
            genre_id: 2,
            label_id: 2,
            title: 'レモン',
            amount: 1500,
            status: 1,
            release: '発売日だよ',
            explanation: '曲の説明とか'
        }
    ]
)

EndUser.create!(
    last_name: 'ラスト',
    first_name: 'ファストネーム',
    last_name_kana: 'ラストかな',
    first_name_kana: 'ファストかな',
    main_postal_code: '333333',
    main_address: 'メイン県メイン市テスト333',
    phone_number: '09033333333',
    password: 'ramen0141',
    email: 'ramen0141@test'
)

CartProduct.create!(
    [
        {
            end_user_id: 1,
            product_id: 1,
            quantity: '5'
        },
        {
            end_user_id: 1,
            product_id: 2,
            quantity: '3'
        }
    ]
)

Order.create!(
    end_user_id: 1,
    purchase_price_total: 5000,
    payment_method: 1,
    postage: 500,
    delivery_name: 'テストテスコ',
    delivery_postal_code: 333333,
    delivery_address: 'テスト県テス市',
    delivery_status: 0
)

OrderDetail.create!(
    [
        {
            order_id: 1,
            product_id: 1,
            purchase_price: 6000,
            quantity: 3
        },
        {
            order_id: 1,
            product_id: 2,
            purchase_price: 3000,
            quantity: 3
        }
    ]
)

Arrival.create!(
    product_id: 1,
    quantity: 30
)

