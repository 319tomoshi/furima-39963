FactoryBot.define do
  factory :item do
    name                     { Faker::Commerce.product_name }
    description              { Faker::Lorem.paragraph }
    category_id              { Faker::Number.between(from: 2, to: 11) }
    condition_id             { Faker::Number.between(from: 2, to: 7) }
    shipping_fee_paid_by_id  { Faker::Number.between(from: 2, to: 3) }
    origin_region_id         { Faker::Number.between(from: 2, to: 48) }
    shipping_day_id          { Faker::Number.between(from: 2, to: 4) }
    price                    { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
