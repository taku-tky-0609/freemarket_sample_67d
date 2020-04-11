FactoryBot.define do

  factory :address do
    user_id          {100}
    postal_code      {Faker::Address.postcode}
    prefectures      {"東京都"}
    municipality     {"渋谷区"}
    building         {"アジアビル"}
  end
end