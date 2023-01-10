FactoryBot.define do
  factory :user do
    email {Faker::Internet.free_email}
    password {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    nickname {Faker::Name.last_name}
    firstname {Faker::Name.last_name}
    lastname {Faker::Name.last_name}
    firstname_kana {Faker::Name.last_name}
    lastname_kana {Faker::Name.last_name}
    birthday {Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
  end
end
