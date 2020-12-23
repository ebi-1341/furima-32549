FactoryBot.define do
  factory :buy_item do
    postcode { '123-4567' }
    region_id { Faker::Number.between(from: 2, to: 48) }
    city_name { '東京都' }
    house_number { '1-1' }
    building { 'ハイツ' }
    phone_number { 11_122_223_333 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
