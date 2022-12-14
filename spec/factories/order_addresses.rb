FactoryBot.define do
  factory :order_address do
    post_code     { Faker::Number.number(digits: 7).to_s.insert(3, '-') }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city          { Faker::Address.city }
    street        { Faker::Address.street_address }
    building      { Faker::Address.building_number }
    phone_number  { Faker::Number.number(digits: 11) }
    token         { 'tok_abcdefghijk00000000000000000' }
  end
end
