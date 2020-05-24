FactoryBot.define do

  factory :item do 
    user_id               {Faker::Number.between(from: 1, to: 100)}
    item_name             {Faker::JapaneseMedia::OnePiece.character}
    price                 {Faker::Number.number(digits: 8)}
    category_id           {Faker::Number.between(from: 1, to: 100)}
    status_id             {Faker::Number.between(from: 1, to: 100)}
    brand                 {Faker::Number.between(from: 1, to: 100)}
    size                  {Faker::String.random(length: [1, 6])}
    delivery_fee_id       {Faker::Number.between(from: 1, to: 100)}
    delivery_method_id    {Faker::Number.between(from: 1, to: 100)}
    prefecture_id         {Faker::Number.between(from: 1, to: 100)}
    estimated_delivery_id {Faker::Number.between(from: 1, to: 100)}

    association :user
    association :category
    association :brand
  end
end