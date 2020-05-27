FactoryBot.define do

  factory :item do 
    user_id               {Faker::Number.between(from: 1, to: 100)}
    item_name             {Faker::JapaneseMedia::OnePiece.character}
    price                 {Faker::Number.number(digits: 8)}
    category_id           {Faker::Number.between(from: 1, to: 100)}
    status_id             {Faker::Number.between(from: 1, to: 100)}
    brand_id              {Faker::Number.between(from: 1, to: 100)}
    size                  {Faker::String.random(length: [1, 6])}
    delivery_fee_id       {Faker::Number.between(from: 1, to: 100)}
    delivery_method_id    {Faker::Number.between(from: 1, to: 100)}
    prefecture_id         {Faker::Number.between(from: 1, to: 100)}
    estimated_delivery_id {Faker::Number.between(from: 1, to: 100)}
    after(:build) do |item|
      item.item_images.attach(io: File.open('spec/fixtures/test_image.jpg'), filename: 'test_image.jpg', content_type: 'image/jpg')
    end
    
    association :user
    association :category
    association :brand
    association :item_image
  end
end