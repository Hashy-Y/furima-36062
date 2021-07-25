FactoryBot.define do
  factory :item, class: Item do
    item_name           { Faker::Lorem.word }
    description         { Faker::Lorem.sentence }
    category_id         { Faker::Number.within(range: 2..11)}
    condition_id        { Faker::Number.within(range: 2..7) }
    postage_id          { Faker::Number.within(range: 2..3) }
    delivery_area_id    { Faker::Number.within(range: 2..48) }
    delivery_period_id  { Faker::Number.within(range: 2..4) }
    price               { Faker::Number.within(range: 300..9999999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end