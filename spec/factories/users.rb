FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {"福岡"}
    last_name             {"花子"}
    first_name_kana       {"フクオカ"}
    last_name_kana        {"ハナコ"}
    birthday              {"2021-01-01"}
  end
end