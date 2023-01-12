FactoryBot.define do
  factory :category do
    id   {Faker::Number.between(from: 2, to: 11)}
    name { '---' }

    after(:build) do |category|
      category.class.data = [
        { id: 1, name: '---' },
        { id: 2, name: 'メンズ' },
        { id: 3, name: 'レディース' },
        { id: 4, name: 'ベビー・キッズ' },
        { id: 5, name: 'インテリア・住まい・小物' },
        { id: 6, name: '本・音楽・ゲーム' },
        { id: 7, name: 'おもちゃ・ホビー・グッズ' },
        { id: 8, name: '家電・スマホ・カメラ' },
        { id: 9, name: 'スポーツ・レジャー' },
        { id: 10, name: 'ハンドメイド' },
        { id: 11, name: 'その他' }
      ]
    end
  end
end