FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6, mix_case: true) }
    password_confirmation { password }
    last_name { '田中' }
    first_name { '太郎' }
    last_name_kana { 'タナカ' }
    first_name_kana { 'タロウ' }
    birthday { Faker::Date.between(from: '1936-01-01', to: '2013-01-01') }
  end
end
