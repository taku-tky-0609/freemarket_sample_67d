FactoryBot.define do

  factory :category do
    name             {Faker::JapaneseMedia::OnePiece.character}
    ancestry         {nil}
  end
end