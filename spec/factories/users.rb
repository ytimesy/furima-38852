FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    email {Faker::Internet.free_email}
    password {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    nickname {Faker::Name.last_name}
    firstname { person.first.kanji }
    lastname { person.last.kanji }
    firstname_kana { person.first.katakana }
    lastname_kana { person.last.katakana }
    birthday {Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
  end
end
