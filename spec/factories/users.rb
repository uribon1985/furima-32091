FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    first_name {'田中'}
    first_name_kana {'タナカ'}
    last_name {'太郎'}
    last_name_kana {'タロウ'}
    birthday {'1985/1/1'}
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
  end
end
