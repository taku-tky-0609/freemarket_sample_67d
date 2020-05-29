FactoryBot.define do

  factory :address do
    association :user
    postal_code      {Faker::Address.postcode}
    prefectures      {"東京都"}
    municipality     {"渋谷区"}
    house_number     {"333"}
    building         {"アジアビル"}
  end
end