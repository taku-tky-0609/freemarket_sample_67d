FactoryBot.define do

  factory :user do
    nickname               {Faker::Name.name}
    email                  {"keisuke@gmail.com"}
    last_name              {Faker::Name.last_name}
    first_name             {Faker::Name.first_name}
    last_name_kana         {"オオタニ"}
    first_name_kana        {"ケイスケ"}
    phone_number           {Faker::PhoneNumber.cell_phone.gsub(/-/, '')}
    password               {"12345678"}
    reset_password_token   {"12345678"}
    birthday               {"1989/11/24"}
  end
end