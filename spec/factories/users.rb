FactoryBot.define do
  factory :user do
    nickname               { Faker::Name.name }
    email                  { Faker::Internet.email }
    password               { 'password123' }
    password_confirmation  { password }
    last_name              { '中村' }
    first_name             { '知思' }
    last_name_kana         { 'ナカムラ' }
    first_name_kana        { 'トモシ' }
    date_of_birth          { Faker::Date.birthday }
  end
end
