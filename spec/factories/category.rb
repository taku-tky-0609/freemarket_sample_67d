FactoryBot.define do

  factory :category do
    name             {Faker::JapaneseMedia::OnePiece.character}
    ancestry         {nil}
    # factory :child_category do |f|
    #   f.parent create(:category)

    #   factory :grand_category do |g|
    #     g.parent create(:category)
    #   end
    # end 
  end
end