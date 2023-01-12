FactoryBot.define do
  factory :deliveryfee_type do
    id   {Faker::Number.between(from: 2, to: 3)}
    name { '---' }

    after(:build) do |deliveryfee_type|
      deliveryfee_type.class.data = [
        { id: 1, name: '---' },
        { id: 2, name: '着払い(購入者負担)' },
        { id: 3, name: '送料込み(出品者負担)' }
      ]
    end
  end
end