FactoryBot.define do
  factory :item do
    name
    description
    category_id
    condition_id
    shipping_fee_paid_by_id
    origin_region_id
    shipping_day_id
    price
    user_id
  end
end
