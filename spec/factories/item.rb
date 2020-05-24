FactoryBot.define do

  factory :item do
    # id           {Faker::Number.between(from: 1, to: 100)}
    user                  {Faker::Number.number(digits: 2)}
    item_name             {Faker::JapaneseMedia::OnePiece.character}
    price                 {Faker::Number.number(digits: 8)}
    category              {1}
    # category_id           {Faker::String.random(length: [1, 6])}
    status_id             {Faker::Number.between(from: 1, to: 100)}
    brand                 {Faker::Number.between(from: 1, to: 100)}
    size                  {Faker::String.random(length: [1, 6])}
    delivery_fee_id       {Faker::Number.between(from: 1, to: 100)}
    delivery_method_id    {Faker::Number.between(from: 1, to: 100)}
    delivery_area_id      {Faker::Number.between(from: 1, to: 100)}
    estimated_delivery_id {Faker::Number.between(from: 1, to: 100)}
    # image                  {Faker::String.random(length: [1, 6])}
    # created_at           {Faker::Number.between(from: 1, to: 100)}
    # updared_at           {Faker::Number.between(from: 1, to: 100)}
  end
end