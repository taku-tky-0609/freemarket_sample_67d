FactoryBot.define do

  factory :item do 
    item_name             {Faker::JapaneseMedia::OnePiece.character}
    price                 {Faker::Number.number(digits: 8)}
    status_id             {Faker::Number.between(from: 1, to: 2)}
    size                  {"S"}
    delivery_fee_id       {Faker::Number.between(from: 1, to: 2)}
    delivery_method_id    {Faker::Number.between(from: 1, to: 2)}
    prefecture_id         {Faker::Number.between(from: 1, to: 2)}
    estimated_delivery_id {Faker::Number.between(from: 1, to: 2)}

    item_images { [build(:item_image)]}
    category {create(:category)}
    association :user
    association :brand
  end
end