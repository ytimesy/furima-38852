FactoryBot.define do
  factory :item do
    name                {Faker::Team.name}
    content             {Faker::Lorem.sentence}
    category_id         {Faker::Number.between(from: 2, to: 11)}
    status_id           {Faker::Number.between(from: 2, to: 7)}
    deliveryfee_type_id {Faker::Number.between(from: 2, to: 3)}
    prefecture_id       {Faker::Number.between(from: 2, to: 48)}
    delivery_when_id    {Faker::Number.between(from: 2, to: 4)}
    itemfee             {Faker::Number.between(from: 300, to: 9999999)}

    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    extend ActiveHash::Associations::ActiveRecordExtensions
    association :category
    association :status
    association :deliveryfee_type
    association :prefecture
    association :delivery_when
  end
end
