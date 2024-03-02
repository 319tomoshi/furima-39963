FactoryBot.define do
  factory :purchase_address do
    association :purchase
    postal_code { '123-4567' }
    origin_region_id { 2 }
    city { '相模原市中央区' }
    street_number { '淵野辺1-1-1' }
    building_name { 'パディントン103' }
    phone_number { '07012345678' }
  end
end
