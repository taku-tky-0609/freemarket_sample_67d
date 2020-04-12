FactoryBot.define do

  factory :user do
    nickname               {Faker::Name.name}
    email                  {Faker::Internet.email}
    last_name              {Faker::Name.last_name}
    first_name             {Faker::Name.first_name}
    last_name_kana         {Faker::Name.last_name}
    first_name_kana        {Faker::Name.first_name}
    address                {Faker::Internet.email}
    phone_number           {Faker::PhoneNumber.phone_number}
    password               {password}
    reset_password_token   {password}
    reset_password_sent_at {Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)}
    remember_created_at    {Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)}
    self_introduction      {Faker::Lorem.word}
    sales                  {Faker::Number.number}
    point                  {Faker::Number.number}
    icon                   {Faker::Avatar.image}
  end
end