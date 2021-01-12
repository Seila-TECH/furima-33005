FactoryBot.define do
  factory :item do
    item_name             {Faker::Commerce.product_name}
    item_profile          {Faker::Lorem.sentence}
    category_id           {Faker::Number.between(from:2, to:11)}
    item_status_id        {Faker::Number.between(from:2, to:7)}
    shipping_fee_id       {Faker::Number.between(from:2, to:3)}
    shipping_erea_id      {Faker::Number.between(from:2, to:48)}
    shipping_date_id      {Faker::Number.between(from:2, to:4)}
    price                 {Faker::Number.between(from:300, to:9999999)}
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/logo.png'), filename: 'logo.png')
    end
  end
end
