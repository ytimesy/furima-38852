FactoryBot.define do
  factory :purchase_delivery do
    postcode      {'123-4567'}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    city          {Faker::Address.city}
    address       {Faker::Address.street_address}
    building      {Faker::Lorem.word}
    tel           {'09012345678'}
    token         {Faker::Lorem.characters(number: 10)}
    user_id       {Faker::Number.between(from: 1, to: 10)}
    item_id       {Faker::Number.between(from: 11, to: 20)}
  end
end
