FactoryBot.define do
  factory :buy_address, class: BuyAddress  do
    postal_code { '123-4567' }
    delivery_area_id { 1 }
    city { '東京都' }
    address_line { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09012345678' }
    association :item
    association :user
  end
end
