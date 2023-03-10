FactoryBot.define do
  factory :delivery_when do
    id   {Faker::Number.between(from: 2, to: 4)}
    name { '---' }

    after(:build) do |delivery_when|
      delivery_when.class.data = [
        { id: 1, name: '---' },
        { id: 2, name: '1~2日で発送' },
        { id: 3, name: '2~3日で発送' },
        { id: 4, name: '4~7日で発送' }
      ]
    end
  end
end