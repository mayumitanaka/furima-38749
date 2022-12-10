FactoryBot.define do
  factory :item do
    item_name               { Faker::Lorem.word }
    item_info               { Faker::Lorem.paragraph }
    item_price              { Faker::Number.between(from: 300, to: 9999999) }
    item_category_id        { Faker::Number.between(from: 2, to: 11) }
    item_status_id          { Faker::Number.between(from: 2, to: 7) }
    shipping_fee_status_id  { Faker::Number.between(from: 2, to: 3) }
    prefecture_id           { Faker::Number.between(from: 2, to: 48) }
    scheduled_delivery_id   { Faker::Number.between(from: 2, to: 4) }
  end
end
